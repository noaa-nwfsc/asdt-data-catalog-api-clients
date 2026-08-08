# nwfscDataCatalog::BottomTrawlStationSearches


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**leg_number** | **integer** | Leg increment number when a sampling operation took place.  Each vessel participating in the survey partakes in multiple legs (leg #1, #2...) as part of the survey schedule within a given pass, with each survey containing multiple passes per year.  A vessel on the WCGBTS Shelf/Slope Survey typically is scheduled for 5 legs per year, although this is subject to change due to year-to-year schedule differences. | [optional] 
**pass_number** | **integer** | Pass increment number when a sampling operation took place (i.e. pass #1, #2...).  Each annual survey typically has multiple passes, with each pass being assigned one or several vessels to participate in sampling. | [optional] 
**survey_year** | **integer** | Calendar year in integer format YYYY during which data was collected. | [optional] 
**vessel_name** | **character** | Full name of the commercial or research vessel used to collect the data at sea. | [optional] 
**captain_name** | **character** | Full name of the vessel captain. | [optional] 
**search_notes** | **character** | Notes and field remarks recorded during the station search. | [optional] 
**resulting_tows** | **object** | JSONB array of successfully executed bottom trawl tows resulting from this search. | [optional] 
**search_ended_at** | **character** | The timestamp when the search operation ended. | [optional] 
**nmfs_project_name** | **character** | Name of the project/survey under the National Marine Fisheries Service (NMFS) for which the data was collected. | [optional] 
**search_started_at** | **character** | The timestamp when the search operation started. | [optional] 
**target_station_code** | **character** | Code of the target sampling site station. | [optional] 
**search_elapsed_time_s** | **numeric** | The elapsed duration of the search operation in seconds. | [optional] 
**field_party_chief_name** | **character** | Full name of the field party chief. | [optional] 
**search_result_type_name** | **character** | Description name of the search result type. | [optional] 
**search_vessel_track_geom** | [**GeoJSON**](GeoJSON.md) |  | [optional] 
**bottom_trawl_operation_key** | **character** | A 12-character numeric unique identifier for a West Coast Groundfish Bottom Trawl sampling operation.     It is constructed by concatenating key operational attributes into a single string. For example, the operation key **&#x60;202203020001&#x60;** breaks down as follows:    * **Survey Year (Digits 1-4):** The 4-digit year (YYYY) of sampling (e.g., &#x60;2022&#x60;).  * **Operation Type (Digits 5-6):** The 2-digit code representing the survey operation type (e.g., &#x60;03&#x60;).  * **Vessel ID (Digits 7-9):** The 3-digit, zero-padded identifier for the participating vessel (e.g., &#x60;020&#x60;).  * **Operation Increment (Digits 10-12):** The 3-digit, zero-padded sequential operation increment (e.g., &#x60;001&#x60;). | [optional] 
**target_station_boundary_geom** | [**GeoJSON**](GeoJSON.md) |  | [optional] 
**target_station_centroid_geom** | [**GeoJSON**](GeoJSON.md) |  | [optional] 
**untrawlable_site_reason_name** | **character** | Description of the untrawlable reason. | [optional] 


