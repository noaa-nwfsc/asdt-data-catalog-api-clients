from unittest.mock import MagicMock, call, patch

import pandas as pd
import pytest

from nwfsc_data_catalog.factory import (
    DataCatalog,
    NwfscCollection,
    transform_dsl_value,
)


@pytest.mark.parametrize(
    ("value", "expected"),
    [
        (["Aggressor", "Oceanus"], "in:Aggressor~Oceanus"),
        ([2020, 2025], "in:2020~2025"),
        ((2020, 2025), "between:2020~2025"),
        (range(2000, 2010), "between:2000~2010"),
        (range(2000, 2010, 2), "between:2000~2010"),
        ({"gt": 500}, "gt:500"),
        ({"contains": "hake"}, "contains:hake"),
        ("direct_string", "direct_string"),
        (42, "42"),
        (None, None),
        (True, True),
        (False, False),
    ],
)
def test_transform_dsl_value(value, expected):
    assert transform_dsl_value(value) == expected


def record(**data):
    item = MagicMock()
    item.to_dict.return_value = data
    return item


def make_catalog():
    with patch("nwfsc_data_catalog.api.default_api.DefaultApi") as api_class:
        catalog = DataCatalog(MagicMock())
        return catalog, api_class.return_value


def test_collection_helpers_and_dataframe_field_selection():
    collection = NwfscCollection(
        [
            record(tow_id=1, vessel_name="Aggressor", year=2023),
            record(tow_id=2, vessel_name="Oceanus", year=2024),
        ]
    )
    collection._fields = ["tow_id", "vessel_name"]

    assert collection.first().to_dict()["tow_id"] == 1
    assert collection.last().to_dict()["tow_id"] == 2
    pd.testing.assert_frame_equal(
        collection.to_dataframe(),
        pd.DataFrame(
            [
                {"tow_id": 1, "vessel_name": "Aggressor"},
                {"tow_id": 2, "vessel_name": "Oceanus"},
            ]
        ),
    )


def test_empty_collection_helpers_and_dataframe():
    collection = NwfscCollection()

    assert collection.first() is None
    assert collection.last() is None
    assert collection.to_dataframe().empty


def test_dynamic_read_proxy_translates_filters_and_returns_dataframe():
    catalog, api = make_catalog()
    api.get_bottom_trawl_tows.return_value = [
        record(tow_id=1, vessel_name="Aggressor", year=2023),
        record(tow_id=2, vessel_name="Oceanus", year=2024),
    ]

    result = catalog.read_bottom_trawl_tows(
        vessel_name=["Aggressor", "Oceanus"],
        year=range(2020, 2025),
        depth_m={"gte": 100},
        fields=["tow_id", "vessel_name"],
        limit=25,
        offset=10,
    )

    api.get_bottom_trawl_tows.assert_called_once_with(
        vessel_name="in:Aggressor~Oceanus",
        year="between:2020~2025",
        depth_m="gte:100",
        fields=["tow_id", "vessel_name"],
        limit=25,
        offset=10,
    )
    pd.testing.assert_frame_equal(
        result,
        pd.DataFrame(
            [
                {"tow_id": 1, "vessel_name": "Aggressor"},
                {"tow_id": 2, "vessel_name": "Oceanus"},
            ]
        ),
    )


def test_dynamic_fetch_all_paginates_until_empty_and_combines_results():
    catalog, api = make_catalog()
    page_one = [record(tow_id=1), record(tow_id=2)]
    page_two = [record(tow_id=3)]
    api.get_bottom_trawl_tows.side_effect = [page_one, page_two, []]

    result = catalog.fetch_all_bottom_trawl_tows(
        vessel_name=["Aggressor", "Oceanus"],
        fields="tow_id",
        limit=2,
    )

    assert isinstance(result, NwfscCollection)
    assert result == page_one + page_two
    assert result._fields == "tow_id"
    assert api.get_bottom_trawl_tows.call_args_list == [
        call(
            vessel_name="in:Aggressor~Oceanus",
            fields="tow_id",
            limit=2,
            offset=0,
        ),
        call(
            vessel_name="in:Aggressor~Oceanus",
            fields="tow_id",
            limit=2,
            offset=2,
        ),
        call(
            vessel_name="in:Aggressor~Oceanus",
            fields="tow_id",
            limit=2,
            offset=4,
        ),
    ]
    pd.testing.assert_frame_equal(
        result.to_dataframe(),
        pd.DataFrame([{"tow_id": 1}, {"tow_id": 2}, {"tow_id": 3}]),
    )
