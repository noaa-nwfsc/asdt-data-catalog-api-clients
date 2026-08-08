#' Run MCP Server for NWFSC Data Catalog
#' @description Starts an MCP server exposing R SDK functions as tools.
#' @export
run_mcp_server <- function() {
  if (!requireNamespace("mcptools", quietly = TRUE)) {
    stop("The 'mcptools' package is required but not installed. Please install it first.")
  }
  if (!requireNamespace("ellmer", quietly = TRUE)) {
    stop("The 'ellmer' package is required but not installed. Please install it first.")
  }
  if (!requireNamespace("jsonlite", quietly = TRUE)) {
    stop("The 'jsonlite' package is required but not installed. Please install it first.")
  }

  metadata_json <- get_sdk_metadata()
  metadata <- jsonlite::fromJSON(metadata_json, simplifyDataFrame = FALSE)

  tools <- list()
  for (item in metadata) {
    if (!startsWith(item$name, "read_")) {
      next
    }

    # Retrieve the exported function from our package namespace
    func <- getExportedValue("nwfscDataCatalog", item$name)

    # Build argument schema dynamically
    arguments <- list()
    for (param_name in names(item$parameters)) {
      if (param_name == "...") {
        next
      }
      param_desc <- item$parameters[[param_name]]
      if (param_name == "limit" || grepl("year", param_name)) {
        arguments[[param_name]] <- ellmer::type_integer(param_desc)
      } else {
        arguments[[param_name]] <- ellmer::type_string(param_desc)
      }
    }

    # Instantiate the ellmer tool
    t <- ellmer::tool(
      fun = func,
      name = item$name,
      description = item$description,
      arguments = arguments
    )

    tools[[length(tools) + 1]] <- t
  }

  message("Starting NWFSC Data Catalog R MCP Server...")
  mcptools::mcp_server(tools = tools)
}
