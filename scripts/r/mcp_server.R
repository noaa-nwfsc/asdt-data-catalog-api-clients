# Source assessment skills module if running locally or inside package
if (file.exists("scripts/r/assessment_skills.R")) {
  source("scripts/r/assessment_skills.R")
} else if (file.exists("R/assessment_skills.R")) {
  source("R/assessment_skills.R")
}

#' Run MCP Server for NWFSC Data Catalog
#' @description Starts an MCP server exposing R SDK functions as tools alongside advanced biometrics skills.
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

  # 1. Map standard SDK read_* functions into MCP tools
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

  # 2. Instantiate and append Advanced Fisheries Biometrics MCP Skills
  tool_expand_comps <- ellmer::tool(
    fun = skill_expand_compositions,
    name = "skill_expand_compositions",
    description = "Fisheries biometrics skill: Define latitude/depth strata and expand catch and biological/specimen data into length, age, and conditional age-at-length (CAAL) compositions. Returns file paths to the generated CSVs.",
    arguments = list(
      catch_data = ellmer::type_any("A data frame of catch records (with columns like year, catch_weight, lat, depth, etc.)."),
      bio_data = ellmer::type_any("A data frame of individual biological/specimen records (with columns like year, length_cm, age, sex, etc.).")
    )
  )

  tool_generate_index <- ellmer::tool(
    fun = skill_generate_index,
    name = "skill_generate_index",
    description = "Fisheries biometrics skill: Fit a spatiotemporal Tweedie sdmTMB model to catch data and extract a standardized index of abundance. Returns the path to the saved index CSV.",
    arguments = list(
      catch_data = ellmer::type_any("A data frame of catch/density records (must include spatial coordinates longitude/latitude or X/Y, and year)."),
      formula_str = ellmer::type_string("Formula string for the sdmTMB model (e.g. 'catch_weight ~ 0 + as.factor(year)').")
    )
  )

  tool_build_ss3 <- ellmer::tool(
    fun = skill_build_ss3,
    name = "skill_build_ss3",
    description = "Fisheries biometrics skill: Read a template Stock Synthesis (SS3) .dat file, inject new CPUE/index and composition blocks, and write out a new .dat file. Returns the path to the newly written .dat file.",
    arguments = list(
      index_csv = ellmer::type_string("Optional path to a CSV file containing the standardized abundance index to inject."),
      length_csv = ellmer::type_string("Optional path to a CSV file containing the expanded length compositions to inject."),
      age_csv = ellmer::type_string("Optional path to a CSV file containing the expanded marginal age compositions to inject."),
      template_dir = ellmer::type_string("Path to the directory containing template SS3 files (including a template .dat file).")
    )
  )

  tools[[length(tools) + 1]] <- tool_expand_comps
  tools[[length(tools) + 1]] <- tool_generate_index
  tools[[length(tools) + 1]] <- tool_build_ss3

  message("Starting NWFSC Data Catalog R MCP Server with advanced Biometrics Skills...")
  mcptools::mcp_server(tools = tools)
}
