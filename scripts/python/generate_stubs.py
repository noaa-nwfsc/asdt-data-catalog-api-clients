import importlib
import inspect
import sys


def generate(package_name, client_dir):
    # Dynamically import the generated API
    api_mod = importlib.import_module(f"{package_name}.api.default_api")
    api_class = getattr(api_mod, "DefaultApi")

    stub_content = [
        "from typing import *",
        "import pandas as pd",
        "from pydantic import *",  # Imports StrictStr, StrictInt, etc. used by OpenAPI
        "from .factory import NwfscCollection",
        "\nclass DataCatalog:",
    ]

    for name, method in inspect.getmembers(api_class, predicate=inspect.isfunction):
        if name.startswith("get_"):
            sig = inspect.signature(method)

            # THE FIX: Strip the existing return annotation (e.g. -> List[Model])
            clean_sig = sig.replace(return_annotation=inspect.Signature.empty)

            # Now we can safely append our custom return types
            stub_content.append(f"    def {name}{clean_sig} -> NwfscCollection: ...")
            stub_content.append(
                f"    def {name.replace('get_', 'read_')}{clean_sig} -> pd.DataFrame: ..."
            )
            stub_content.append(
                f"    def {name.replace('get_', 'fetch_all_')}{clean_sig} -> NwfscCollection: ..."
            )

    # Write the stub file
    out_path = f"clients/{client_dir}/src/{package_name}/factory.pyi"
    with open(out_path, "w") as f:
        f.write("\n".join(stub_content))


if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python generate_stubs.py <package_name> <client_dir>")
        sys.exit(1)
    generate(sys.argv[1], sys.argv[2])
