import json

import pytest
from openapi_spec_validator import validate


def load_spec(path):
    with open(path, "r") as f:
        return json.load(f)


@pytest.mark.parametrize(
    "spec_path", ["openapi/openapi-public.json"],
)
def test_openapi_validity(spec_path):
    """Checks if the JSON is actually a valid OpenAPI 3.0.3 spec."""
    spec_dict = load_spec(spec_path)
    validate(spec_dict)


@pytest.mark.parametrize(
    "spec_path", ["openapi/openapi-public.json"],
)
def test_nwfsc_custom_extensions(spec_path):
    """Ensures our 'Elite' requirements are present in the spec."""
    spec = load_spec(spec_path)

    # 1. Check for GeoJSON component
    assert "GeoJSON" in spec["components"]["schemas"], (
        f"Missing GeoJSON schema in {spec_path}"
    )

    # 2. Check for explode: false on $fields
    fields_param = spec["components"]["parameters"].get("FieldsParam")
    assert fields_param is not None, "FieldsParam missing from components"
    assert fields_param.get("explode") is False, (
        "Explode must be false for $fields list support"
    )

    # 3. Check for the read_ wrapper's targets
    # (Ensure we have at least one 'get_' method to wrap)
    paths = spec["paths"]
    has_get_method = any(
        name.startswith("/get") or "get" in str(ops) for name, ops in paths.items()
    )
    assert has_get_method, "No 'get' paths found to wrap"


def test_pydantic_compatibility():
    """Verify that pydantic objects in the spec don't use 'type: any'"""
    # This caught your earlier 'Any' error!
    spec = load_spec("openapi/openapi-public.json")
    spec_str = json.dumps(spec)
    assert '"type": "any"' not in spec_str.lower(), "Found invalid 'type: any' in spec"


@pytest.mark.parametrize(
    "spec_path", ["openapi/openapi-public.json"],
)
def test_no_typeless_properties(spec_path):
    """
    Hunts down properties that cause the 'Codegen property is null'
    warning in the openapi-generator.
    """
    spec = load_spec(spec_path)
    schemas = spec.get("components", {}).get("schemas", {})

    typeless_props = []

    for model_name, model_def in schemas.items():
        properties = model_def.get("properties", {})

        for prop_name, prop_def in properties.items():
            # What defines a valid structure in OpenAPI?
            keys = prop_def.keys()
            has_structure = any(
                k in keys for k in ["type", "$ref", "anyOf", "allOf", "oneOf"]
            )

            if not has_structure:
                # Grab the source/storage types if they exist for better debugging context
                src_type = prop_def.get("x-nwfsc-source-type", "Unknown")
                typeless_props.append(f"{model_name}.{prop_name} (Source: {src_type})")

    # If the list isn't empty, fail the test and print the exact culprits
    error_msg = "🚨 Found properties missing OpenAPI types. These will cause typing.Any warnings:\n\n"
    error_msg += "\n".join(typeless_props)

    assert not typeless_props, error_msg
