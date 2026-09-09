options(repos = c(CRAN = "https://cloud.r-project.org"))
args <- commandArgs(trailingOnly = TRUE)
if (length(args) != 2) stop("Usage: Rscript generate_r_wrappers.R <openapi_json_path> <output_r_dir>")

spec_path <- args[1]
out_dir <- args[2]

if (!requireNamespace("jsonlite", quietly = TRUE)) install.packages("jsonlite")
if (!requireNamespace("roxygen2", quietly = TRUE)) install.packages("roxygen2")
if (!requireNamespace("httr", quietly = TRUE)) install.packages("httr")
if (!requireNamespace("base64enc", quietly = TRUE)) install.packages("base64enc")
if (!requireNamespace("stringr", quietly = TRUE)) install.packages("stringr")
spec <- jsonlite::fromJSON(spec_path, simplifyVector = FALSE)

wrapper_code <- c(
  "# THIS FILE IS AUTO-GENERATED. DO NOT EDIT DIRECTLY.",
  "#' @importFrom tibble tibble",
  "NULL",
  ""
)

# 1. 🚀 INITIALIZE METADATA WITH CUSTOM UI METHODS
metadata_list <- list(
  list(
    name = "to_html",
    description = "Converts a dataframe into a styled HTML table string for direct UI rendering.",
    parameters = list(df = "The tibble/dataframe to convert.")
  ),
  list(
    name = "to_json_records",
    description = "Converts a dataframe into a JavaScript-friendly JSON array of objects.",
    parameters = list(df = "The tibble/dataframe to convert.")
  ),
  list(
    name = "to_plot_img",
    description = "Generates a base plot and returns a Base64-encoded HTML <img> tag.",
    parameters = list(df = "The dataframe.", x_col = "X-axis column string.", y_col = "Y-axis column string.", type = "Plot type ('p' for points, 'l' for lines).")
  ),
  list(
    name = "glimpse_html",
    description = "Generates an HTML X-ray profile of the dataset showing types, missing values, and a preview.",
    parameters = list(df = "The tibble/dataframe to profile.")
  )
)

# 2. LOOP THROUGH API ENDPOINTS
for (path in names(spec$paths)) {
  endpoint <- spec$paths[[path]]$get
  if (is.null(endpoint)) next
  
  op_id <- endpoint$operationId 
  pascal_method <- paste0(toupper(substr(op_id, 1, 1)), substr(op_id, 2, nchar(op_id)))
  
  base_func <- gsub("([a-z])([A-Z])", "\\1_\\2", op_id)
  base_func <- tolower(base_func)
  read_func <- sub("^get_", "read_", base_func)
  fetch_func <- sub("^get_", "fetch_all_", base_func)
  
  summary <- if (!is.null(endpoint$summary)) endpoint$summary else "Fetch API Data"
  
  # 🚀 OMIT DYNAMIC 1:1 ENDPOINTS FROM THE METADATA DRAWER TO KEEP MCP SERVER CONSOLIDATED
  
  roxygen <- c(
    sprintf("#' %s", summary),
    "#'",
    "#' @description Executes a request against the Data Catalog API and returns a modern tibble.",
    "#' @param ... Dynamic filter parameters.",
    "#' @param limit Maximum records to retrieve per page.",
    "#' @param fields Column selection.",
    "#' @return A \\code{tibble} dataframe.",
    "#' @export"
  )
  
  func_def <- c(
    sprintf("%s <- function(..., limit = 1000, fields = NULL) {", read_func),
    "  args <- list(...)",
    "  if (!is.null(fields)) args$fields <- as.list(fields)",
    "  args$limit <- limit",
    "  api <- DefaultApi$new(get_nwfsc_client())",
    sprintf("  api_method <- api$%s", pascal_method),
    sprintf("  fetch_as_tibble(api_method, args, fetch_all = FALSE, endpoint_path = '%s')", path),
    "}"
  )
  
  fetch_def <- c(
    sprintf("#' @rdname %s", read_func),
    "#' @export",
    sprintf("%s <- function(...) {", fetch_func),
    "  args <- list(...)",
    "  if (!is.null(args$fields)) args$fields <- as.list(args$fields)",
    "  api <- DefaultApi$new(get_nwfsc_client())",
    sprintf("  api_method <- api$%s", pascal_method),
    sprintf("  fetch_as_tibble(api_method, args, fetch_all = TRUE, endpoint_path = '%s')", path),
    "}"
  )
  
  wrapper_code <- c(wrapper_code, roxygen, func_def, fetch_def, "")
}

# 3. 🚀 APPEND CONSOLIDATED TOOLS TO METADATA DRAWER & WRAPPER CODE
metadata_list[[length(metadata_list) + 1]] <- list(
  name = "read_bottom_trawl_data",
  description = "Consolidated fetcher for the West Coast Bottom Trawl survey datasets.",
  parameters = list(
    data_type = "Dataset type: tows, catch, specimens, vessels, sampling_stations, station_searches, search_results, common_names, survey_years, nmfs_projects, triennial_vessels, triennial_survey_years, triennial_nmfs_projects, shelf_slope_vessels, shelf_slope_survey_years.",
    limit = "Max records to retrieve.",
    fields = "Comma-separated columns to return."
  )
)

metadata_list[[length(metadata_list) + 1]] <- list(
  name = "read_hook_and_line_data",
  description = "Consolidated fetcher for the West Coast Hook and Line survey datasets.",
  parameters = list(
    data_type = "Dataset type: vessels, common_names.",
    limit = "Max records to retrieve.",
    fields = "Comma-separated columns to return."
  )
)

metadata_list[[length(metadata_list) + 1]] <- list(
  name = "read_nwfsc_metadata",
  description = "Consolidated fetcher for general NWFSC survey metadata and taxonomy.",
  parameters = list(
    data_type = "Dataset type: survey_taxonomy, all_survey_years, all_taxon_categories, all_taxon_subcategories, hook_and_line_survey_years, triennial_specimen_lengths.",
    limit = "Max records to retrieve.",
    fields = "Comma-separated columns to return."
  )
)

consolidated_code <- c(
  "#' Consolidated Bottom Trawl Data Fetcher",
  "#' @description Fetch consolidated datasets for West Coast Bottom Trawl.",
  "#' @param data_type Dataset type (e.g., tows, catch, specimens, vessels, sampling_stations, station_searches, search_results, common_names, survey_years, nmfs_projects, triennial_vessels, triennial_survey_years, triennial_nmfs_projects, shelf_slope_vessels, shelf_slope_survey_years).",
  "#' @param limit Max records to retrieve.",
  "#' @param fields Column selection.",
  "#' @param ... Dynamic filter parameters.",
  "#' @export",
  "read_bottom_trawl_data <- function(data_type, limit = 1000, fields = NULL, ...) {",
  "  mapping <- list(",
  "    tows = 'read_bottom_trawl_tows',",
  "    catch = 'read_bottom_trawl_catch',",
  "    specimens = 'read_bottom_trawl_specimens',",
  "    vessels = 'read_bottom_trawl_vessels',",
  "    sampling_stations = 'read_bottom_trawl_sampling_stations',",
  "    station_searches = 'read_bottom_trawl_station_searches',",
  "    search_results = 'read_bottom_trawl_search_results',",
  "    common_names = 'read_bottom_trawl_common_names',",
  "    survey_years = 'read_bottom_trawl_survey_years',",
  "    nmfs_projects = 'read_bottom_trawl_nmfs_projects',",
  "    triennial_vessels = 'read_bottom_trawl_triennial_vessels',",
  "    triennial_survey_years = 'read_bottom_trawl_triennial_survey_years',",
  "    triennial_nmfs_projects = 'read_bottom_trawl_triennial_nmfs_projects',",
  "    shelf_slope_vessels = 'read_bottom_trawl_shelf_slope_vessels',",
  "    shelf_slope_survey_years = 'read_bottom_trawl_shelf_slope_survey_years'",
  "  )",
  "  if (!(data_type %in% names(mapping))) {",
  "    stop(paste('Invalid data_type. Valid options:', paste(names(mapping), collapse = ', ')))",
  "  }",
  "  func_name <- mapping[[data_type]]",
  "  func <- get(func_name, envir = asNamespace('nwfscDataCatalog'))",
  "  func(limit = limit, fields = fields, ...)",
  "}",
  "",
  "#' Consolidated Hook and Line Data Fetcher",
  "#' @description Fetch consolidated datasets for West Coast Hook and Line.",
  "#' @param data_type Dataset type (e.g., vessels, common_names).",
  "#' @param limit Max records to retrieve.",
  "#' @param fields Column selection.",
  "#' @param ... Dynamic filter parameters.",
  "#' @export",
  "read_hook_and_line_data <- function(data_type, limit = 1000, fields = NULL, ...) {",
  "  mapping <- list(",
  "    vessels = 'read_hook_and_line_vessels',",
  "    common_names = 'read_hook_and_line_common_names'",
  "  )",
  "  if (!(data_type %in% names(mapping))) {",
  "    stop(paste('Invalid data_type. Valid options:', paste(names(mapping), collapse = ', ')))",
  "  }",
  "  func_name <- mapping[[data_type]]",
  "  func <- get(func_name, envir = asNamespace('nwfscDataCatalog'))",
  "  func(limit = limit, fields = fields, ...)",
  "}",
  "",
  "#' Consolidated NWFSC Metadata and Taxonomy Fetcher",
  "#' @description Fetch general NWFSC survey metadata and taxonomy.",
  "#' @param data_type Dataset type (e.g., survey_taxonomy, all_survey_years, all_taxon_categories, all_taxon_subcategories, hook_and_line_survey_years, triennial_specimen_lengths).",
  "#' @param limit Max records to retrieve.",
  "#' @param fields Column selection.",
  "#' @param ... Dynamic filter parameters.",
  "#' @export",
  "read_nwfsc_metadata <- function(data_type, limit = 1000, fields = NULL, ...) {",
  "  mapping <- list(",
  "    survey_taxonomy = 'read_nwfsc_survey_taxonomy',",
  "    all_survey_years = 'read_nwfsc_all_survey_years',",
  "    all_taxon_categories = 'read_nwfsc_all_taxon_categories',",
  "    all_taxon_subcategories = 'read_nwfsc_all_taxon_subcategories',",
  "    hook_and_line_survey_years = 'read_nwfsc_hook_and_line_survey_years',",
  "    triennial_specimen_lengths = 'read_nwfsc_triennial_specimen_lengths'",
  "  )",
  "  if (!(data_type %in% names(mapping))) {",
  "    stop(paste('Invalid data_type. Valid options:', paste(names(mapping), collapse = ', ')))",
  "  }",
  "  func_name <- mapping[[data_type]]",
  "  func <- get(func_name, envir = asNamespace('nwfscDataCatalog'))",
  "  func(limit = limit, fields = fields, ...)",
  "}"
)

wrapper_code <- c(wrapper_code, consolidated_code)

# 4. EMBED METADATA AS AN EXPORTED R FUNCTION
metadata_json_str <- as.character(jsonlite::toJSON(metadata_list, auto_unbox = TRUE))
metadata_json_str <- gsub("'", "\\\\'", metadata_json_str) # Escape quotes for R string

embed_code <- c(
  "#' Get Package Metadata (JSON)",
  "#' @description Returns a JSON string of all available methods and UI utilities.",
  "#' @name get_sdk_metadata",
  "#' @export",
  sprintf("get_sdk_metadata <- function() { return('%s') }", metadata_json_str)
)

wrapper_code <- c(wrapper_code, embed_code)

# ---> CRITICAL: Ensure the file path includes "R" <---
out_file <- file.path(out_dir, "R", "elite_wrappers.R")
writeLines(wrapper_code, out_file)

# ---> CRITICAL: Save metadata to inst/ so it builds with the tarball <---
inst_dir <- file.path(out_dir, "inst")
if (!dir.exists(inst_dir)) dir.create(inst_dir)
writeLines(jsonlite::toJSON(metadata_list, auto_unbox = TRUE, pretty = TRUE), file.path(inst_dir, "catalog_metadata.json"))