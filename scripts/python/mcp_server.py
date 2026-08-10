import json
import logging
import sys
from typing import Any, List, Optional, Union
try:
    from typing import Annotated
except ImportError:
    from typing_extensions import Annotated
from mcp.server.fastmcp import FastMCP
from nwfsc_data_catalog import ApiClient, Configuration, DataCatalog

# Configure logging
logging.basicConfig(level=logging.INFO, format="%(asctime)s - %(name)s - %(levelname)s - %(message)s")
logger = logging.getLogger("nwfsc_data_catalog.mcp_server")

# Instantiate FastMCP server
mcp = FastMCP("NWFSC Data Catalog")

# Instantiate the Data Catalog SDK
config = Configuration()
api_client = ApiClient(config)
catalog = DataCatalog(api_client)

# Dynamically register all 'read_*' methods from catalog metadata
try:
    metadata_str = catalog.get_sdk_metadata()
    metadata = json.loads(metadata_str)
except Exception as e:
    logger.error(f"Failed to fetch SDK metadata from DataCatalog: {e}")
    sys.exit(1)

def simplify_type(type_str: str) -> str:
    type_str_lower = type_str.lower()
    if "list" in type_str_lower:
        return "Optional[List[str]]"
    elif "bool" in type_str_lower:
        return "Optional[bool]"
    elif "int" in type_str_lower:
        return "Optional[int]"
    elif "float" in type_str_lower or "number" in type_str_lower:
        return "Optional[float]"
    elif "str" in type_str_lower:
        return "Optional[str]"
    else:
        return "Optional[Any]"


dynamic_funcs = {}

for item in metadata:
    name = item.get("name")
    if not name or not name.startswith("read_"):
        continue

    description = item.get("description", "Fetch data from the NOAA NWFSC Data Catalog.")
    parameters = item.get("parameters", {})

    # Build function signature arguments and call arguments
    sig_args = []
    call_args = []

    for p_name, p_type in parameters.items():
        if p_name in ("self", "kwargs", "**kwargs") or p_name.startswith("_"):
            continue

        clean_type = simplify_type(p_type)
        sig_args.append(f"{p_name}: {clean_type} = None")
        call_args.append(f"{p_name}={p_name}")

    # Add standard dynamic parameters (limit and fields) if not already declared in signature
    if "limit" not in parameters:
        sig_args.append("limit: int = 1000")
        call_args.append("limit=limit")
    if "fields" not in parameters:
        sig_args.append("fields: Optional[List[str]] = None")
        call_args.append("fields=fields")

    sig_str = ", ".join(sig_args)
    call_str = ", ".join(call_args)

    # Dynamic function definition
    fn_code = f"""
def {name}({sig_str}) -> Any:
    \"\"\"{description}\"\"\"
    return catalog.{name}({call_str})
"""

    ctx = {
        "catalog": catalog,
        "Any": Any,
        "List": List,
        "Optional": Optional,
        "Union": Union,
        "Annotated": Annotated,
    }

    try:
        exec(fn_code, ctx)
        fn = ctx[name]
        # Keep reference to prevent GC
        dynamic_funcs[name] = fn
        # Register tool with FastMCP
        mcp.tool(name=name, description=description)(fn)
        logger.info(f"Registered dynamic tool: {name}")
    except Exception as e:
        logger.error(f"Failed to dynamically define/register tool {name}: {e}")


def main():
    """Runs the FastMCP server."""
    # Register assessment skills
    try:
        from nwfsc_data_catalog.assessment_skills import (
            skill_generate_design_index, 
            skill_expand_compositions, 
            skill_build_ss3
        )
        mcp.tool(name="skill_generate_design_index", description="Calculate stratified area-swept biomass indices, SE, and CV across depth/latitude strata.")(skill_generate_design_index)
        mcp.tool(name="skill_expand_compositions", description="Perform weighted stratum expansions on length and age frequencies.")(skill_expand_compositions)
        mcp.tool(name="skill_build_ss3", description="Parse an SS3 .dat template file, inject new index/composition data, and write out a new file.")(skill_build_ss3)
        logger.info("Registered assessment skill tools.")
    except ImportError as e:
        logger.warning(f"Could not import assessment skills (this is normal during bootstrapping): {e}")

    logger.info("Starting NWFSC Data Catalog FastMCP Server...")
    mcp.run()


if __name__ == "__main__":
    main()
