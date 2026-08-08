You are an expert AI developer and fisheries biometrician. We are adding advanced Model Context Protocol (MCP) skills to our existing R SDK (`nwfscDataCatalog`). 

I have a detailed technical report saved in this directory called `assessment_report.md`. It explains exactly how West Coast stock assessors use standard R packages (`nwfscSurvey`, `sdmTMB`, `r4ss`) to process data from our SDK.

Please execute the following tasks sequentially:

1. READ THE CONTEXT
- Read the file `assessment_report.md` completely. Pay close attention to the "Proposed Agent Workflow" section and the specific function calls mentioned (e.g., `get_expanded_comps`, `stewart_hamel`, `sdmTMB::get_index`, `SS_writedat`).

2. CREATE THE SKILLS MODULE
- Create a new file: `scripts/r/assessment_skills.R`.
- In this file, write three distinct R functions that act as wrappers for the specialized packages. 
- **Function 1:** `skill_expand_compositions(catch_data, bio_data)`. It should use `nwfscSurvey::create_strata()`, `get_expanded_comps(..., input_n_method = "stewart_hamel")`, and `get_raw_caal()`. Have it save the outputs as CSV files in a temporary directory and return the file paths.
- **Function 2:** `skill_generate_index(catch_data, formula_str)`. It should use `sdmTMB::make_mesh()`, fit an `sdmTMB()` model, and use `sdmTMB::get_index()`. Return the path to a saved CSV of the index.
- **Function 3:** `skill_build_ss3(index_csv, length_csv, age_csv, template_dir)`. It should use `r4ss::SS_readdat()`, inject the new data into the CPUE and composition blocks, and use `SS_writedat()`.

3. WIRE INTO THE MCP SERVER
- Edit the existing `scripts/r/mcp_server.R` file (or create it if it doesn't exist).
- Source the new `assessment_skills.R` file at the top.
- Use `ellmer::tool()` to define these three new skills so the AI agent knows exactly what inputs they require (e.g., dataframes from the SDK) and what they output (CSV paths).
- Add these new tools to the `mcptools::mcp_server(tools = ...)` initialization alongside the existing SDK `read_*` tools.

4. UPDATE DEPENDENCIES (CRITICAL FOR WEBR)
- Edit `scripts/python/build_tools.py` and ensure that `nwfscSurvey`, `sdmTMB`, `r4ss`, `mcptools`, and `ellmer` are added *STRICTLY* to the `Suggests` section of the R `DESCRIPTION` file patch script. 
- DO NOT add them to the `Imports` section. This SDK is compiled to WebAssembly (WebR) for browser use, and adding heavy statistical or networking packages as hard dependencies will break the WebR compiler.

Take your time, ensure the R syntax is correct, and do not attempt to rewrite the statistical models from scratch—rely purely on the standard R packages as defined in the report.