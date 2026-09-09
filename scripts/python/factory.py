import inspect
import json
import logging
from typing import Any, Callable, Optional

import pandas as pd

logger = logging.getLogger(__name__)


def transform_dsl_value(val: Any) -> Any:
    """Translates Python types into the NWFSC API Filter DSL."""
    if val is None:
        return None
    if isinstance(val, bool):
        return val

    if isinstance(val, str):
        # Allow pass-through if the user explicitly typed an operator prefix (e.g., "contains:rockfish")
        return val

    if isinstance(val, (list, set)):
        # Joined with tildes for multi-value IN filters
        return f"in:{'~'.join(map(str, val))}"

    if isinstance(val, (tuple, range)):
        # Handles (2020, 2025) or range(2020, 2026)
        start = val[0] if isinstance(val, tuple) else val.start
        stop = val[1] if isinstance(val, tuple) else val.stop
        return f"between:{start}~{stop}"

    if isinstance(val, dict):
        # Handles explicit dict operators:
        # e.g., {'startswith': 'WCGBTS'}, {'contains': 'rockfish'}, {'endswith': '2024'}
        operator, value = next(iter(val.items()))
        return f"{operator}:{value}"

    return str(val)


class NwfscCollection(list):
    """List subclass with shortcuts for Data Science workflows."""

    _fields = None

    def first(self) -> Optional[Any]:
        """Returns the first record or None."""
        return self[0] if self else None

    def last(self) -> Optional[Any]:
        """Returns the last record or None."""
        return self[-1] if self else None

    def to_dataframe(self) -> pd.DataFrame:
        """Converts collection into a Pandas DataFrame."""
        if not self:
            return pd.DataFrame()
        df = pd.DataFrame([obj.to_dict() for obj in self])

        # Trim the DataFrame down to only requested fields
        if self._fields:
            # Handle both list ['a', 'b'] and comma string "a,b"
            f_list = (
                self._fields
                if isinstance(self._fields, (list, tuple, set))
                else [f.strip() for f in self._fields.split(",")]
            )
            valid_cols = [c for c in f_list if c in df.columns]
            if valid_cols:
                df = df[valid_cols]

        return df

    def to_geopandas(
        self, geometry_col: str = "vessel_track_geom", crs: str = "EPSG:4326"
    ):
        """Converts to GeoDataFrame. Requires 'geopandas' and 'shapely'."""
        try:
            import geopandas as gpd
            from shapely.geometry import shape
        except ImportError:
            raise ImportError("Please install 'geopandas' and 'shapely' to use this.")
        df = self.to_dataframe()
        if df.empty or geometry_col not in df.columns:
            return df
        df["geometry"] = df[geometry_col].apply(lambda x: shape(x) if x else None)
        return gpd.GeoDataFrame(df, geometry="geometry", crs=crs)

    def to_csv(self, path: str, **kwargs):
        """Export collection to CSV via Pandas."""
        return self.to_dataframe().to_csv(path, index=False, **kwargs)

    def _repr_html_(self):
        """Jupyter Notebook auto-table rendering."""
        return self.to_dataframe()._repr_html_()


class DataCatalog:
    """The Elite NWFSC Data Catalog Client."""

    def __init__(self, api_client):
        from .api.default_api import DefaultApi

        self._api = DefaultApi(api_client)

    def _list_methods(self):
        """Helper for introspection/autocomplete to find dynamic methods."""
        base = [
            n for n in dir(self._api)
            if n.startswith("get_")
            and not n.endswith("_with_http_info")
            and not n.endswith("_without_preload_content")
        ]
        return sorted(
            base
            + [n.replace("get_", "read_") for n in base]
            + [n.replace("get_", "fetch_all_") for n in base]
        )

    def __dir__(self):
        """Enables tab-completion in IDEs and Jupyter."""
        return sorted(list(super().__dir__()) + self._list_methods())

    def __getattr__(self, name: str) -> Callable:
        # Handle .read_... (DataFrame) and .fetch_all_... (Pagination)
        prefix = None
        if name.startswith("read_"):
            prefix = "read_"
        elif name.startswith("fetch_all_"):
            prefix = "fetch_all_"

        if prefix:
            base_method_name = name.replace(prefix, "get_", 1)
            original_method = getattr(self._api, base_method_name)

            def dynamic_proxy(*args, **kwargs):
                if prefix == "read_":
                    return getattr(self, base_method_name)(
                        *args, **kwargs
                    ).to_dataframe()
                return self._pagination_loop(base_method_name, **kwargs)

            dynamic_proxy.__doc__ = f"Dynamic {prefix} wrapper for {base_method_name}.\n{original_method.__doc__}"
            return dynamic_proxy

        attr = getattr(self._api, name)
        return (
            self._wrap_call(attr)
            if callable(attr) and name.startswith("get_")
            else attr
        )

    def read_bottom_trawl_data(
        self,
        data_type: str,
        limit: int = 1000,
        fields: list = None,
        **kwargs
    ) -> pd.DataFrame:
        """
        Consolidated fetcher for the West Coast Bottom Trawl survey datasets.
        
        Args:
            data_type (str): Type of bottom trawl data to retrieve. Options: tows, catch, specimens, vessels, sampling_stations, station_searches, search_results, common_names, survey_years, nmfs_projects, triennial_vessels, triennial_survey_years, triennial_nmfs_projects, shelf_slope_vessels, shelf_slope_survey_years.
            limit (int): Max records to retrieve. Defaults to 1000.
            fields (list): Optional list of columns to return.
            **kwargs: Dynamic filter parameters (e.g., vessel_name="Oceanus", survey_year=2024).
        """
        mapping = {
            "tows": "bottom_trawl_tows",
            "catch": "bottom_trawl_catch",
            "specimens": "bottom_trawl_specimens",
            "vessels": "bottom_trawl_vessels",
            "sampling_stations": "bottom_trawl_sampling_stations",
            "station_searches": "bottom_trawl_station_searches",
            "search_results": "bottom_trawl_search_results",
            "common_names": "bottom_trawl_common_names",
            "survey_years": "bottom_trawl_survey_years",
            "nmfs_projects": "bottom_trawl_nmfs_projects",
            "triennial_vessels": "bottom_trawl_triennial_vessels",
            "triennial_survey_years": "bottom_trawl_triennial_survey_years",
            "triennial_nmfs_projects": "bottom_trawl_triennial_nmfs_projects",
            "shelf_slope_vessels": "bottom_trawl_shelf_slope_vessels",
            "shelf_slope_survey_years": "bottom_trawl_shelf_slope_survey_years",
        }
        if data_type not in mapping:
            raise ValueError(f"Invalid bottom trawl data_type '{data_type}'. Valid options: {list(mapping.keys())}")
        
        read_func = getattr(self, f"read_{mapping[data_type]}")
        return read_func(limit=limit, fields=fields, **kwargs)

    def read_hook_and_line_data(
        self,
        data_type: str,
        limit: int = 1000,
        fields: list = None,
        **kwargs
    ) -> pd.DataFrame:
        """
        Consolidated fetcher for the West Coast Hook and Line survey datasets.
        
        Args:
            data_type (str): Type of hook and line data to retrieve. Options: vessels, common_names.
            limit (int): Max records to retrieve. Defaults to 1000.
            fields (list): Optional list of columns to return.
            **kwargs: Dynamic filter parameters (e.g., vessel_name="Aggressor").
        """
        mapping = {
            "vessels": "hook_and_line_vessels",
            "common_names": "hook_and_line_common_names",
        }
        if data_type not in mapping:
            raise ValueError(f"Invalid hook and line data_type '{data_type}'. Valid options: {list(mapping.keys())}")
        
        read_func = getattr(self, f"read_{mapping[data_type]}")
        return read_func(limit=limit, fields=fields, **kwargs)

    def read_nwfsc_metadata(
        self,
        data_type: str,
        limit: int = 1000,
        fields: list = None,
        **kwargs
    ) -> pd.DataFrame:
        """
        Consolidated fetcher for general NWFSC survey metadata and taxonomy.
        
        Args:
            data_type (str): Type of metadata/taxonomy to retrieve. Options: survey_taxonomy, all_survey_years, all_taxon_categories, all_taxon_subcategories, hook_and_line_survey_years, triennial_specimen_lengths.
            limit (int): Max records to retrieve. Defaults to 1000.
            fields (list): Optional list of columns to return.
            **kwargs: Dynamic filter parameters (e.g., survey_year=2024).
        """
        mapping = {
            "survey_taxonomy": "nwfsc_survey_taxonomy",
            "all_survey_years": "nwfsc_all_survey_years",
            "all_taxon_categories": "nwfsc_all_taxon_categories",
            "all_taxon_subcategories": "nwfsc_all_taxon_subcategories",
            "hook_and_line_survey_years": "nwfsc_hook_and_line_survey_years",
            "triennial_specimen_lengths": "nwfsc_triennial_specimen_lengths",
        }
        if data_type not in mapping:
            raise ValueError(f"Invalid metadata data_type '{data_type}'. Valid options: {list(mapping.keys())}")
        
        read_func = getattr(self, f"read_{mapping[data_type]}")
        return read_func(limit=limit, fields=fields, **kwargs)

    def get_sdk_metadata(self) -> str:
        """
        Scans the DataCatalog instance and returns a JSON string of all available
        methods, their parameters, and docstrings to populate the UI drawer.
        """
        metadata = []

        # Introspect Explicitly Defined Methods starting with read_
        for name, method in inspect.getmembers(
            self.__class__, predicate=inspect.isfunction
        ):
            if name.startswith("_") or not name.startswith("read_"):
                continue

            docstring = inspect.getdoc(method) or "No description available."
            sig = inspect.signature(method)

            params = {
                p_name: str(p.annotation).replace("typing.", "")
                if p.annotation != inspect.Parameter.empty
                else "Any"
                for p_name, p in sig.parameters.items()
                if p_name not in ("self", "kwargs")
            }

            if any(
                p.kind == inspect.Parameter.VAR_KEYWORD for p in sig.parameters.values()
            ):
                params["**kwargs"] = "Dynamic filter parameters (e.g., limit=10)"

            metadata.append(
                {
                    "name": name,
                    "description": docstring.split("\n")[0],  # First line of docstring
                    "parameters": params,
                }
            )

        return json.dumps(metadata)

    def _pagination_loop(self, method_name: str, **kwargs) -> NwfscCollection:
        all_data, limit, offset = [], kwargs.get("limit", 1000), 0
        fields = kwargs.get("fields")

        while True:
            kwargs.update({"limit": limit, "offset": offset})
            batch = getattr(self, method_name)(**kwargs)
            if not batch:
                break
            all_data.extend(batch)
            offset += limit

        # FIX: Create the collection first, then attach the attribute
        col = NwfscCollection(all_data)
        col._fields = fields
        return col

    def _wrap_call(self, func: Callable) -> Callable:
        def wrapper(*args, **kwargs):
            transformed = {
                k: transform_dsl_value(v)
                if k not in ("limit", "offset", "fields")
                else v
                for k, v in kwargs.items()
            }
            res = func(*args, **transformed)

            if isinstance(res, list):
                # FIX: Create the collection first, then attach the attribute
                col = NwfscCollection(res)
                col._fields = kwargs.get("fields")
                return col
            return res

        return wrapper
