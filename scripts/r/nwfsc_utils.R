#' @importFrom magrittr %>%
#' @importFrom dplyr bind_rows
#' @importFrom tibble as_tibble
NULL

# --- 1. GLOBAL CLIENT MANAGEMENT ---
.nwfsc_env <- new.env(parent = emptyenv())

#' Initialize the NWFSC Data Catalog Client
#' @param token Optional Bearer token for private access.
#' @export
login_nwfsc <- function(token = NULL) {
  # Configuration and ApiClient are provided by the OpenAPI Generator
  if (exists("Configuration")) {
    config <- Configuration$new()
    if (!is.null(token)) config$access_token <- token
    .nwfsc_env$client <- ApiClient$new(configuration = config)
  } else {
    # Fallback for versions where Configuration is bundled differently
    client <- ApiClient$new()
    if (!is.null(token)) client$defaultHeaders[["Authorization"]] <- paste("Bearer", token)
    .nwfsc_env$client <- client
  }
}

#' Get the active client
#' @export
get_nwfsc_client <- function() {
  if (is.null(.nwfsc_env$client)) login_nwfsc()
  return(.nwfsc_env$client)
}

# --- 2. DSL TRANSLATION ---
transform_dsl <- function(val) {
  if (is.null(val)) return(NULL)
  
  # 1. Named List Operators: e.g. list(contains = "rockfish"), list(startswith = "WCGBTS")
  if (is.list(val) && !is.null(names(val)) && length(val) == 1) {
    op <- names(val)[1]
    return(paste0(op, ":", val[[1]]))
  }
  
  # 2. Multi-value Vectors: e.g. c(2024, 2025) -> "in:2024~2025"
  if (length(val) > 1) {
    return(paste0("in:", paste(val, collapse = "~")))
  }
  
  # 3. Direct String Pass-Through (e.g. "contains:rockfish", "2024")
  return(as.character(val))
}

# --- 3. THE CORE FETCH ENGINE ---
fetch_as_tibble <- function(api_func, kwargs, fetch_all = FALSE, endpoint_path = NULL) {
  special_keys <- c("limit", "offset", "fields")
  for (name in names(kwargs)) {
    if (!(name %in% special_keys)) {
      kwargs[[name]] <- transform_dsl(kwargs[[name]])
    }
  }
  
  limit <- if (!is.null(kwargs$limit)) kwargs$limit else 1000
  offset <- 0
  all_data <- list()
  
  # Detect if we are running in WebAssembly (WebR)
  is_webr <- base::Sys.info()[["sysname"]] == "Emscripten"
  
  repeat {
    kwargs$limit <- limit
    kwargs$offset <- offset
    
    if (is_webr && !is.null(endpoint_path)) {
      # 🕸️ WEBR FLOW: Use the native browser XHR bridge
      # This bypasses the 'httr' and 'curl' dependency entirely
      base_url <- "https://www.webapps.nwfsc.noaa.gov/data-catalog/api/v1"
      
      qs_pairs <- c()
      for (k in names(kwargs)) {
        val <- kwargs[[k]]
        if (!is.null(val)) {
          # --- CORRECTED LOGIC: Use comma for 'fields', tilde for everything else ---
          if (length(val) > 1 || is.list(val)) {
            if (k == "fields") {
              val <- paste(unlist(val), collapse = ",")
            } else {
              val <- paste(unlist(val), collapse = "~")
            }
          }
          # --------------------------------------------------------------------------
          qs_pairs <- c(qs_pairs, paste0(k, "=", URLencode(as.character(val), reserved = TRUE)))
        }
      }
      qs_string <- if (length(qs_pairs) > 0) paste0("?", paste(qs_pairs, collapse = "&")) else ""
      full_url <- paste0(base_url, endpoint_path, qs_string)
      
      # 🚀 THE SYNCHRONOUS BRIDGE
      # download.file with method='xhr' pauses WebR until the browser fetch completes
      temp_json <- tempfile(fileext = ".json")
      download.file(full_url, destfile = temp_json, method = "xhr", quiet = TRUE)
      
      batch_df <- as.data.frame(jsonlite::fromJSON(temp_json))
      unlink(temp_json)
      
      if (nrow(batch_df) == 0) break
      
    } else {
      # 💻 DESKTOP FLOW: Uses standard R6 / httr classes
      res <- do.call(api_func, kwargs)
      if (length(res) == 0) break
      batch_df <- dplyr::bind_rows(lapply(res, function(x) jsonlite::fromJSON(x$toJSONString())))
    }
    
    all_data <- append(all_data, list(batch_df))
    if (!fetch_all || nrow(batch_df) < limit) break
    offset <- offset + limit
  }
  
  if (length(all_data) == 0) return(tibble::tibble())
  df <- dplyr::bind_rows(all_data)
  
  # Trim to requested fields
  if (!is.null(kwargs$fields)) {
    req_cols <- unlist(kwargs$fields)
    valid_cols <- intersect(req_cols, colnames(df))
    if (length(valid_cols) > 0) df <- df[, valid_cols]
  }
  
  return(tibble::as_tibble(df))
}

# --- 4. CONVENIENCE & UI METHODS ---

#' Convert a dataframe to an HTML table string
#' @param df The dataframe to convert
#' @export
to_html <- function(df) {
  if (nrow(df) == 0) return("<table><tr><td>No data available.</td></tr></table>")
  header <- paste0("<tr>", paste0("<th>", colnames(df), "</th>", collapse=""), "</tr>")
  rows <- apply(df, 1, function(row) {
    paste0("<tr>", paste0("<td>", row, "</td>", collapse=""), "</tr>")
  })
  paste0("<table border='1' class='nwfsc-table'><thead>", header, "</thead><tbody>", paste(rows, collapse=""), "</tbody></table>")
}

#' Convert dataframe to a JSON array of records
#' @param df The dataframe to convert
#' @export
to_json_records <- function(df) {
  if (nrow(df) == 0) return("[]")
  jsonlite::toJSON(df, dataframe = "rows", na = "null", auto_unbox = TRUE)
}

#' Generate a base plot and return an HTML image tag
#' @param df The dataframe
#' @param x_col X column name
#' @param y_col Y column name
#' @param type Plot type ("p", "l", etc)
#' @export
to_plot_img <- function(df, x_col, y_col, type = "p") {
  if (!requireNamespace("base64enc", quietly = TRUE)) stop("base64enc required")
  temp_file <- tempfile(fileext = ".png")
  png(temp_file, width = 600, height = 400, res = 96)
  plot(df[[x_col]], df[[y_col]], main = paste(y_col, "vs", x_col), xlab = x_col, ylab = y_col, type = type, col = "#0072B2", pch = 16)
  dev.off()
  b64 <- base64enc::base64encode(temp_file)
  unlink(temp_file)
  paste0("<img src='data:image/png;base64,", b64, "' style='max-width:100%; height:auto;' />")
}

#' Generate an HTML profile of the dataset
#' @param df The dataframe to profile
#' @export
glimpse_html <- function(df) {
  num_rows <- nrow(df); num_cols <- ncol(df)
  header <- paste0("<h3>Data Profile: ", num_rows, " rows x ", num_cols, " columns</h3>")
  rows <- lapply(names(df), function(col_name) {
    col_data <- df[[col_name]]
    paste0("<tr><td><b>", col_name, "</b></td><td><small>", class(col_data)[1], "</small></td><td>", sum(is.na(col_data)), "</td></tr>")
  })
  paste0(header, "<table border='1'><thead><tr><th>Col</th><th>Type</th><th>NAs</th></tr></thead><tbody>", paste(rows, collapse=""), "</tbody></table>")
}