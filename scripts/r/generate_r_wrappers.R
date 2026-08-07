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
  
  # 🚀 ADD TO METADATA DRAWER
  metadata_list[[length(metadata_list) + 1]] <- list(
    name = read_func,
    description = summary,
    parameters = list("..." = "Dynamic filter parameters.", limit = "Max records to retrieve per page.", fields = "Comma-separated columns to return.")
  )
  
  metadata_list[[length(metadata_list) + 1]] <- list(
    name = fetch_func,
    description = paste("Fetch ALL pages for:", summary),
    parameters = list("..." = "Dynamic filter parameters.", fields = "Comma-separated columns to return.")
  )
  
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

# 3. EMBED METADATA AS AN EXPORTED R FUNCTION
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