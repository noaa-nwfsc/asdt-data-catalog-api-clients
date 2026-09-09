import json
from unittest.mock import MagicMock, patch
import pandas as pd
import pytest

from nwfsc_data_catalog.mcp_server import dynamic_funcs


def test_mcp_dynamic_funcs_serialize_dataframe():
    # Verify that we have some dynamic functions registered
    assert len(dynamic_funcs) > 0
    assert "read_bottom_trawl_tows" in dynamic_funcs

    dynamic_read_func = dynamic_funcs["read_bottom_trawl_tows"]

    # Mock the catalog.read_bottom_trawl_tows method to return a DataFrame containing different types of data,
    # including NaN values and standard values.
    dummy_df = pd.DataFrame([
        {"tow_id": 1, "vessel_name": "Aggressor", "survey_year": 2023, "depth_m": float("nan")},
        {"tow_id": 2, "vessel_name": "Oceanus", "survey_year": 2024, "depth_m": 123.4},
    ])

    with patch("nwfsc_data_catalog.mcp_server.catalog.read_bottom_trawl_tows") as mock_read:
        mock_read.return_value = dummy_df

        # Call the dynamic MCP tool function
        res = dynamic_read_func(limit=10)

        # Assertions
        assert isinstance(res, dict)
        assert "records" in res
        records = res["records"]
        assert len(records) == 2

        # Record 1
        assert records[0]["tow_id"] == 1
        assert records[0]["vessel_name"] == "Aggressor"
        assert records[0]["survey_year"] == 2023
        assert records[0]["depth_m"] is None  # NaN correctly serialized to None (null)

        # Record 2
        assert records[1]["tow_id"] == 2
        assert records[1]["vessel_name"] == "Oceanus"
        assert records[1]["survey_year"] == 2024
        assert records[1]["depth_m"] == 123.4
