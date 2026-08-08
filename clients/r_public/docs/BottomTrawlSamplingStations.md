# nwfscDataCatalog::BottomTrawlSamplingStations


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**station_area_ha** | **numeric** | The total geographic area of the station boundary, in hectares. | [optional] 
**source_wcgbts_id** | **character** | The primary key identifier from the upstream source application database, retained for auditing and exact record matching. | [optional] 
**is_station_active** | **character** | Boolean flag indicating whether the station is currently active and eligible for selection in the survey design. | [optional] 
**station_max_depth_m** | **numeric** | The maximum recorded or charted depth of the station, in meters. | [optional] 
**station_min_depth_m** | **numeric** | The minimum recorded or charted depth of the station, in meters. | [optional] 
**station_centroid_key** | **integer** | A composite spatial key that uniquely identifies the centroid of a WCGBTS (West Coast Groundfish Bottom Trawl Survey) sampling station grid cell.     This key is a fixed 8-character string constructed by converting decimal degree coordinates into Degrees and Decimal Minutes (DDM), stripping away negative signs and truncating specific digits to create a consistent spatial identifier.    ### Component Breakdown  The 8-character format strictly follows the pattern **&#x60;[Lat Degrees][Lat Minutes][Lon Degrees][Lon Minutes]&#x60;**:    * **Latitude Degrees (2 characters):** The whole number of the decimal latitude (e.g., &#x60;43.58&#x60; becomes &#x60;43&#x60;).  * **Latitude Minutes (2 characters):** The decimal remainder of the latitude multiplied by 60 and rounded to the nearest whole number (e.g., &#x60;0.58139 * 60 &#x3D; 34.88&#x60;, which rounds to &#x60;35&#x60;).  * **Longitude Degrees (2 characters):** The whole number of the longitude, ignoring the negative sign (West) and dropping the leading hundreds place (e.g., &#x60;-124.61&#x60; becomes &#x60;24&#x60;).  * **Longitude Minutes (2 characters):** The decimal remainder of the longitude multiplied by 60 and rounded to the nearest whole number (e.g., &#x60;0.61465 * 60 &#x3D; 36.87&#x60;, which rounds to &#x60;37&#x60;).    &gt; **Example:** A grid cell centroid located at decimal coordinates **&#x60;43.58139678, -124.61465068&#x60;** results in the centroid key **&#x60;43352437&#x60;**. | [optional] 
**sampling_station_code** | **character** | The unique alphanumeric code identifying the sampling station (e.g., cell or grid ID). | [optional] 
**station_boundary_geom** | [**GeoJSON**](GeoJSON.md) |  | [optional] 
**station_incorporated_at** | **character** | Date and time when site was first recognized as a sampling area for data collection. | [optional] 
**station_design_type_name** | **character** | The geometric or survey design type of the station (e.g., &#39;Cell&#39;, &#39;Polygon&#39;). | [optional] 
**station_design_suite_name** | **character** | The specific historical or current survey design frame this station belongs to (e.g., &#39;NWFSC Grids 2003&#39;). | [optional] 
**was_station_ever_inactive** | **character** | Boolean indicating if site was inactive for any year/period of time after it was first created. | [optional] 
**station_depth_stratum_name** | **character** | The depth stratification band the station falls within (e.g., &#39;Shelf&#39;, &#39;Upper Slope&#39;). | [optional] 
**station_centroid_latitude_dd** | **numeric** | The sampling sites centroid location latitude. Latitude presented as decimal degrees with up to eight points of precision. Latitude presented as decimal degrees with up to eight points of precision. | [optional] 
**overlapping_state_waters_name** | **character** | The name of the state (WA, OR, CA) whose territorial waters overlap with the station boundary, if applicable. | [optional] 
**station_centroid_longitude_dd** | **numeric** | The sampling sites centroid location longitude. Longitude presented as decimal degrees with up to eight points of precision. Longitude presented as decimal degrees with up to eight points of precision. | [optional] 
**station_latitude_stratum_name** | **character** | The latitudinal stratification band the station falls within, used for survey weighting and selection. | [optional] 
**station_centroid_location_geom** | [**GeoJSON**](GeoJSON.md) |  | [optional] 
**station_last_deactivation_year** | **integer** | The most recent calendar year when the station was deactivated/disabled. | [optional] 
**station_lower_left_latitude_dd** | **numeric** | Latitude of a sampling station&#39;s lower left vertex/corner. Latitude presented as decimal degrees with up to eight points of precision. | [optional] 
**station_upper_left_latitude_dd** | **numeric** | Latitude of a sampling station&#39;s upper left vertex/corner. Latitude presented as decimal degrees with up to eight points of precision. | [optional] 
**station_activation_history_json** | **object** | A nested JSON array containing the Slowly Changing Dimension (SCD) history of the station. Each object in the array represents a period in time and includes &#x60;valid_from&#x60;, &#x60;valid_to&#x60;, &#x60;is_site_active&#x60;, and &#x60;deactivation_reasons&#x60;. | [optional] 
**station_lower_left_longitude_dd** | **numeric** | Longitude of a sampling station&#39;s lower left vertex/corner. Longitude presented as decimal degrees with up to eight points of precision. | [optional] 
**station_lower_right_latitude_dd** | **numeric** | Latitude of a sampling station&#39;s lower right vertex/corner. Latitude presented as decimal degrees with up to eight points of precision. | [optional] 
**station_upper_left_longitude_dd** | **numeric** | Longitude of a sampling station&#39;s upper left vertex/corner. Longitude presented as decimal degrees with up to eight points of precision. | [optional] 
**station_upper_right_latitude_dd** | **numeric** | Latitude of a sampling station&#39;s upper right vertex/corner. Latitude presented as decimal degrees with up to eight points of precision. | [optional] 
**station_lower_right_longitude_dd** | **numeric** | Longitude of a sampling station&#39;s lower right vertex/corner. Longitude presented as decimal degrees with up to eight points of precision. | [optional] 
**station_upper_right_longitude_dd** | **numeric** | Longitude of a sampling station&#39;s upper right vertex/corner. Longitude presented as decimal degrees with up to eight points of precision. | [optional] 
**station_current_deactivation_reasons** | **character** | If the station is currently inactive, the reason(s) why it was removed from the selection pool (e.g., untrawlable, hard bottom, shipping lane). | [optional] 


