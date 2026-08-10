#' Expand composition data for Stock Synthesis
#' @description Custom biometrics skill to define strata and compute expanded length, marginal age, and conditional age-at-length (CAAL) compositions.
#' @param catch_data A data frame of catch data.
#' @param bio_data A data frame of biological data.
#' @return A list containing the file paths to the generated CSVs.
#' @export
skill_expand_compositions <- function(catch_data, bio_data) {
  if (!requireNamespace("nwfscSurvey", quietly = TRUE)) {
    stop("The 'nwfscSurvey' package is required but not installed.")
  }

  # 1. Define standard strata for WCGBTS (standard depths and latitudes)
  strata <- nwfscSurvey::create_strata(
    names = c("shallow_south", "deep_south", "shallow_north", "deep_north"),
    depths_shallow = c(55, 183, 55, 183),
    depths_deep    = c(183, 1280, 183, 1280),
    lats_south     = c(32, 32, 42, 42),
    lats_north     = c(42, 42, 49, 49)
  )

  # Create a temporary directory to save output files
  temp_dir <- tempfile("expand_comps_")
  dir.create(temp_dir, showWarnings = FALSE, recursive = TRUE)

  # Convert columns to standard naming conventions for nwfscSurvey if needed
  # (e.g. length_cm, age, sex, weight, etc.)
  # nwfscSurvey expects lowercase or standard capitalization.

  # 2. Expand length compositions
  len_bins <- seq(10, 80, 2)
  length_comps <- nwfscSurvey::get_expanded_comps(
    bio_data = bio_data,
    catch_data = catch_data,
    comp_bins = len_bins,
    strata = strata,
    comp_column_name = "length_cm",
    output = "full_expansion_ss3_format",
    two_sex_comps = TRUE,
    input_n_method = "stewart_hamel",
    dir = temp_dir
  )

  # 3. Expand marginal age compositions
  age_bins <- 1:40
  age_comps <- nwfscSurvey::get_expanded_comps(
    bio_data = bio_data,
    catch_data = catch_data,
    comp_bins = age_bins,
    strata = strata,
    comp_column_name = "age",
    output = "full_expansion_ss3_format",
    two_sex_comps = TRUE,
    input_n_method = "stewart_hamel",
    dir = temp_dir
  )

  # 4. Generate conditional age-at-length (CAAL)
  caal <- nwfscSurvey::get_raw_caal(
    data = bio_data,
    len_bins = len_bins,
    age_bins = age_bins,
    dir = temp_dir
  )

  # Write explicitly and get clean file paths
  len_path <- file.path(temp_dir, "length_comps_expanded.csv")
  age_path <- file.path(temp_dir, "age_comps_expanded.csv")
  caal_path <- file.path(temp_dir, "caal_raw.csv")

  write.csv(length_comps, len_path, row.names = FALSE)
  write.csv(age_comps, age_path, row.names = FALSE)
  write.csv(caal, caal_path, row.names = FALSE)

  list(
    length_comps_csv = len_path,
    age_comps_csv = age_path,
    caal_csv = caal_path,
    output_dir = temp_dir
  )
}

#' Generate standardized abundance/biomass index using sdmTMB
#' @description Custom biometrics skill to fit a spatiotemporal model and extract a standardized index of abundance.
#' @param catch_data A data frame of catch data.
#' @param formula_str A string representation of the model formula, e.g. "density ~ 0 + as.factor(year)".
#' @return A character string of the path to the saved index CSV.
#' @export
skill_generate_index <- function(catch_data, formula_str) {
  if (!requireNamespace("sdmTMB", quietly = TRUE)) {
    stop("The 'sdmTMB' package is required but not installed.")
  }

  # Standardize spatial columns. If missing X/Y, auto-project from longitude/latitude
  if (!("X" %in% names(catch_data)) || !("Y" %in% names(catch_data))) {
    if (("longitude" %in% names(catch_data)) && ("latitude" %in% names(catch_data))) {
      locs <- sdmTMB::add_utm_columns(catch_data, ll_names = c("longitude", "latitude"), utm_crs = 32610)
      catch_data$X <- locs$X
      catch_data$Y <- locs$Y
    } else if (("lon" %in% names(catch_data)) && ("lat" %in% names(catch_data))) {
      locs <- sdmTMB::add_utm_columns(catch_data, ll_names = c("lon", "lat"), utm_crs = 32610)
      catch_data$X <- locs$X
      catch_data$Y <- locs$Y
    } else {
      stop("Spatial coordinate columns (X/Y or longitude/latitude) are missing from catch_data.")
    }
  }

  # Define time column (default to "year" or "Year")
  time_col <- "year"
  if ("Year" %in% names(catch_data)) {
    time_col <- "Year"
  }

  # 1. Create spatial SPDE mesh
  mesh <- sdmTMB::make_mesh(catch_data, xy_cols = c("X", "Y"), cutoff = 10)

  # 2. Fit the Tweedie spatiotemporal model
  form <- as.formula(formula_str)
  fit <- sdmTMB::sdmTMB(
    formula = form,
    data = catch_data,
    mesh = mesh,
    time = time_col,
    family = sdmTMB::tweedie(link = "log"),
    spatial = "on",
    spatiotemporal = "iid"
  )

  # 3. Create spatial prediction grid replicated for all unique years in dataset
  unique_locs <- unique(catch_data[, c("X", "Y")])
  pred_grid <- sdmTMB::replicate_df(unique_locs, time_col, unique(catch_data[[time_col]]))

  # 4. Predict on grid with TMB object return
  preds <- predict(fit, newdata = pred_grid, return_tmb_object = TRUE)

  # 5. Extract standardized abundance index
  index <- sdmTMB::get_index(preds, bias_correct = TRUE)

  # Save to temporary directory
  temp_dir <- tempfile("generate_index_")
  dir.create(temp_dir, showWarnings = FALSE, recursive = TRUE)
  index_path <- file.path(temp_dir, "standardized_index.csv")
  write.csv(index, index_path, row.names = FALSE)

  return(index_path)
}

#' Build/modify a Stock Synthesis (SS3) data file with new indices and compositions
#' @description Custom biometrics skill to read an SS3 .dat template, inject updated index and composition blocks, and write out the new .dat file.
#' @param index_csv Path to a CSV file of the standardized index.
#' @param length_csv Path to a CSV file of the expanded length compositions.
#' @param age_csv Path to a CSV file of the expanded age compositions.
#' @param template_dir Path to a directory containing the template SS3 files (containing a .dat file).
#' @return A character string of the path to the newly written .dat file.
#' @export
skill_build_ss3 <- function(index_csv, length_csv, age_csv, template_dir) {
  if (!requireNamespace("r4ss", quietly = TRUE)) {
    stop("The 'r4ss' package is required but not installed.")
  }

  # 1. Find template dat file
  dat_files <- list.files(template_dir, pattern = "\\.dat$", ignore.case = TRUE, full.names = TRUE)
  if (length(dat_files) == 0) {
    stop("No .dat file found in template_dir.")
  }
  dat_file_path <- dat_files[1]

  # 2. Parse using SS_readdat
  dat_list <- r4ss::SS_readdat(file = dat_file_path, verbose = FALSE)

  # 3. Inject new index (CPUE) if provided
  if (!is.null(index_csv) && file.exists(index_csv)) {
    new_index_df <- read.csv(index_csv)
    # Inject directly or format based on template CPUE structure
    dat_list$CPUE <- new_index_df
  }

  # 4. Inject length compositions if provided
  if (!is.null(length_csv) && file.exists(length_csv)) {
    new_length_df <- read.csv(length_csv)
    dat_list$lencomp <- new_length_df
  }

  # 5. Inject age compositions if provided
  if (!is.null(age_csv) && file.exists(age_csv)) {
    new_age_df <- read.csv(age_csv)
    dat_list$agecomp <- new_age_df
  }

  # 6. Write out new data file
  temp_dir <- tempfile("build_ss3_")
  dir.create(temp_dir, showWarnings = FALSE, recursive = TRUE)
  out_file_path <- file.path(temp_dir, basename(dat_file_path))

  r4ss::SS_writedat(
    datlist = dat_list,
    outfile = out_file_path,
    overwrite = TRUE,
    verbose = FALSE
  )

  return(out_file_path)
}
