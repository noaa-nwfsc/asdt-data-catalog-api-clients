# DefaultApi

All URIs are relative to *https://www.webapps.nwfsc.noaa.gov/data-catalog/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**GetBottomTrawlBottomTrawlNmfsProjects**](DefaultApi.md#GetBottomTrawlBottomTrawlNmfsProjects) | **GET** /reference/bottom-trawl-nmfs-projects | bottom_trawl_nmfs_projects
[**GetBottomTrawlBottomTrawlSearchResults**](DefaultApi.md#GetBottomTrawlBottomTrawlSearchResults) | **GET** /reference/bottom-trawl-search-results | bottom_trawl_search_results
[**GetBottomTrawlBottomTrawlShelfSlopeSurveyYears**](DefaultApi.md#GetBottomTrawlBottomTrawlShelfSlopeSurveyYears) | **GET** /reference/bottom-trawl-shelf-slope-survey-years | bottom_trawl_shelf_slope_survey_years
[**GetBottomTrawlBottomTrawlShelfSlopeVessels**](DefaultApi.md#GetBottomTrawlBottomTrawlShelfSlopeVessels) | **GET** /reference/bottom-trawl-shelf-slope-vessels | bottom_trawl_shelf_slope_vessels
[**GetBottomTrawlBottomTrawlSurveyYears**](DefaultApi.md#GetBottomTrawlBottomTrawlSurveyYears) | **GET** /reference/bottom-trawl-survey-years | bottom_trawl_survey_years
[**GetBottomTrawlBottomTrawlTriennialNmfsProjects**](DefaultApi.md#GetBottomTrawlBottomTrawlTriennialNmfsProjects) | **GET** /reference/bottom-trawl-triennial-nmfs-projects | bottom_trawl_triennial_nmfs_projects
[**GetBottomTrawlBottomTrawlTriennialSurveyYears**](DefaultApi.md#GetBottomTrawlBottomTrawlTriennialSurveyYears) | **GET** /reference/bottom-trawl-triennial-survey-years | bottom_trawl_triennial_survey_years
[**GetBottomTrawlBottomTrawlTriennialVessels**](DefaultApi.md#GetBottomTrawlBottomTrawlTriennialVessels) | **GET** /reference/bottom-trawl-triennial-vessels | bottom_trawl_triennial_vessels
[**GetBottomTrawlBottomTrawlVessels**](DefaultApi.md#GetBottomTrawlBottomTrawlVessels) | **GET** /reference/bottom-trawl-vessels | bottom_trawl_vessels
[**GetBottomTrawlCatch**](DefaultApi.md#GetBottomTrawlCatch) | **GET** /bottom-trawl/catch | West Coast Bottom Trawl Catch Samples
[**GetBottomTrawlSamplingStations**](DefaultApi.md#GetBottomTrawlSamplingStations) | **GET** /bottom-trawl/sampling-stations | West Coast Bottom Trawl Station Grid
[**GetBottomTrawlSpecimens**](DefaultApi.md#GetBottomTrawlSpecimens) | **GET** /bottom-trawl/specimens | West Coast Bottom Trawl Specimens
[**GetBottomTrawlStationSearches**](DefaultApi.md#GetBottomTrawlStationSearches) | **GET** /bottom-trawl/station-searches | West Coast Bottom Trawl Station Searches
[**GetBottomTrawlTows**](DefaultApi.md#GetBottomTrawlTows) | **GET** /bottom-trawl/tows | West Coast Bottom Trawl Tows
[**GetHookAndLineHookAndLineCommonNames**](DefaultApi.md#GetHookAndLineHookAndLineCommonNames) | **GET** /reference/hook-and-line-common-names | hook_and_line_common_names
[**GetHookAndLineHookAndLineVessels**](DefaultApi.md#GetHookAndLineHookAndLineVessels) | **GET** /reference/hook-and-line-vessels | hook_and_line_vessels
[**GetNwfscAllSurveyYears**](DefaultApi.md#GetNwfscAllSurveyYears) | **GET** /reference/all-survey-years | all_survey_years
[**GetNwfscAllTaxonCategories**](DefaultApi.md#GetNwfscAllTaxonCategories) | **GET** /reference/all-taxon-categories | all_taxon_categories
[**GetNwfscAllTaxonSubcategories**](DefaultApi.md#GetNwfscAllTaxonSubcategories) | **GET** /reference/all-taxon-subcategories | all_taxon_subcategories
[**GetNwfscHookAndLineSurveyYears**](DefaultApi.md#GetNwfscHookAndLineSurveyYears) | **GET** /reference/hook-and-line-survey-years | hook_and_line_survey_years
[**GetNwfscSurveyTaxonomy**](DefaultApi.md#GetNwfscSurveyTaxonomy) | **GET** /nwfsc/survey-taxonomy | NWFSC Survey Taxonomy
[**GetNwfscTriennialSpecimenLengths**](DefaultApi.md#GetNwfscTriennialSpecimenLengths) | **GET** /bottom-trawl/triennial-specimen-lengths | AFSC/RACE Bottom Trawl Triennial Specimen Lengths


# **GetBottomTrawlBottomTrawlNmfsProjects**
> array[BottomTrawlBottomTrawlNmfsProjects] GetBottomTrawlBottomTrawlNmfsProjects(limit = var.limit, fields = var.fields, offset = var.offset, redirect = var.redirect, data_format = var.data_format, response_mode = var.response_mode, include_noncore_fields = var.include_noncore_fields, label = var.label, value = var.value)

bottom_trawl_nmfs_projects

A distinct list of all bottom trawl surveys.

### Example
```R
library(nwfscDataCatalog)

# bottom_trawl_nmfs_projects
#
# prepare function argument(s)
var_limit <- 56 # integer | Max rows to return (Optional)
var_fields <- c("inner_example") # array[character] | Comma-separated column filter (Optional)
var_offset <- 56 # integer | Rows to skip before beginning to return records. (Optional)
var_redirect <- "redirect_example" # character | Force S3 pre-signed redirect (Optional)
var_data_format <- "data_format_example" # character | Response format: json, csv, or parquet (Optional)
var_response_mode <- "response_mode_example" # character | Delivery mode: data, package (Optional)
var_include_noncore_fields <- "include_noncore_fields_example" # character | All fields returned when true, else only core fields returned. (Optional)
var_label <- "label_example" # character | Filter by label (Optional)
var_value <- "value_example" # character | Filter by value (Optional)

api_instance <- DefaultApi$new()
# to save the result into a file, simply add the optional `data_file` parameter, e.g.
# result <- api_instance$GetBottomTrawlBottomTrawlNmfsProjects(limit = var_limit, fields = var_fields, offset = var_offset, redirect = var_redirect, data_format = var_data_format, response_mode = var_response_mode, include_noncore_fields = var_include_noncore_fields, label = var_label, value = var_valuedata_file = "result.txt")
result <- api_instance$GetBottomTrawlBottomTrawlNmfsProjects(limit = var_limit, fields = var_fields, offset = var_offset, redirect = var_redirect, data_format = var_data_format, response_mode = var_response_mode, include_noncore_fields = var_include_noncore_fields, label = var_label, value = var_value)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **integer**| Max rows to return | [optional] 
 **fields** | list( **character** )| Comma-separated column filter | [optional] 
 **offset** | **integer**| Rows to skip before beginning to return records. | [optional] 
 **redirect** | **character**| Force S3 pre-signed redirect | [optional] 
 **data_format** | **character**| Response format: json, csv, or parquet | [optional] 
 **response_mode** | **character**| Delivery mode: data, package | [optional] 
 **include_noncore_fields** | **character**| All fields returned when true, else only core fields returned. | [optional] 
 **label** | [**character**](.md)| Filter by label | [optional] 
 **value** | [**character**](.md)| Filter by value | [optional] 

### Return type

[**array[BottomTrawlBottomTrawlNmfsProjects]**](bottom_trawl_bottom_trawl_nmfs_projects.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/csv, application/zip, application/vnd.apache.parquet

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Success |  -  |
| **302** | Redirect to S3 for large sets or alternative formats |  * Location - The pre-signed S3 URL <br>  |

# **GetBottomTrawlBottomTrawlSearchResults**
> array[BottomTrawlBottomTrawlSearchResults] GetBottomTrawlBottomTrawlSearchResults(limit = var.limit, fields = var.fields, offset = var.offset, redirect = var.redirect, data_format = var.data_format, response_mode = var.response_mode, include_noncore_fields = var.include_noncore_fields, label = var.label, value = var.value)

bottom_trawl_search_results

A distinct list of all search result types recognized on the West Coast Bottom Trawl Groundfish surveys.

### Example
```R
library(nwfscDataCatalog)

# bottom_trawl_search_results
#
# prepare function argument(s)
var_limit <- 56 # integer | Max rows to return (Optional)
var_fields <- c("inner_example") # array[character] | Comma-separated column filter (Optional)
var_offset <- 56 # integer | Rows to skip before beginning to return records. (Optional)
var_redirect <- "redirect_example" # character | Force S3 pre-signed redirect (Optional)
var_data_format <- "data_format_example" # character | Response format: json, csv, or parquet (Optional)
var_response_mode <- "response_mode_example" # character | Delivery mode: data, package (Optional)
var_include_noncore_fields <- "include_noncore_fields_example" # character | All fields returned when true, else only core fields returned. (Optional)
var_label <- "label_example" # character | Filter by label (Optional)
var_value <- "value_example" # character | Filter by value (Optional)

api_instance <- DefaultApi$new()
# to save the result into a file, simply add the optional `data_file` parameter, e.g.
# result <- api_instance$GetBottomTrawlBottomTrawlSearchResults(limit = var_limit, fields = var_fields, offset = var_offset, redirect = var_redirect, data_format = var_data_format, response_mode = var_response_mode, include_noncore_fields = var_include_noncore_fields, label = var_label, value = var_valuedata_file = "result.txt")
result <- api_instance$GetBottomTrawlBottomTrawlSearchResults(limit = var_limit, fields = var_fields, offset = var_offset, redirect = var_redirect, data_format = var_data_format, response_mode = var_response_mode, include_noncore_fields = var_include_noncore_fields, label = var_label, value = var_value)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **integer**| Max rows to return | [optional] 
 **fields** | list( **character** )| Comma-separated column filter | [optional] 
 **offset** | **integer**| Rows to skip before beginning to return records. | [optional] 
 **redirect** | **character**| Force S3 pre-signed redirect | [optional] 
 **data_format** | **character**| Response format: json, csv, or parquet | [optional] 
 **response_mode** | **character**| Delivery mode: data, package | [optional] 
 **include_noncore_fields** | **character**| All fields returned when true, else only core fields returned. | [optional] 
 **label** | [**character**](.md)| Filter by label | [optional] 
 **value** | [**character**](.md)| Filter by value | [optional] 

### Return type

[**array[BottomTrawlBottomTrawlSearchResults]**](bottom_trawl_bottom_trawl_search_results.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/csv, application/zip, application/vnd.apache.parquet

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Success |  -  |
| **302** | Redirect to S3 for large sets or alternative formats |  * Location - The pre-signed S3 URL <br>  |

# **GetBottomTrawlBottomTrawlShelfSlopeSurveyYears**
> array[BottomTrawlBottomTrawlShelfSlopeSurveyYears] GetBottomTrawlBottomTrawlShelfSlopeSurveyYears(limit = var.limit, fields = var.fields, offset = var.offset, redirect = var.redirect, data_format = var.data_format, response_mode = var.response_mode, include_noncore_fields = var.include_noncore_fields, label = var.label, nmfs_project_names = var.nmfs_project_names, value = var.value)

bottom_trawl_shelf_slope_survey_years

A distinct list of all survey years with shelf/slope bottom trawl survey data in the NWFSC database.

### Example
```R
library(nwfscDataCatalog)

# bottom_trawl_shelf_slope_survey_years
#
# prepare function argument(s)
var_limit <- 56 # integer | Max rows to return (Optional)
var_fields <- c("inner_example") # array[character] | Comma-separated column filter (Optional)
var_offset <- 56 # integer | Rows to skip before beginning to return records. (Optional)
var_redirect <- "redirect_example" # character | Force S3 pre-signed redirect (Optional)
var_data_format <- "data_format_example" # character | Response format: json, csv, or parquet (Optional)
var_response_mode <- "response_mode_example" # character | Delivery mode: data, package (Optional)
var_include_noncore_fields <- "include_noncore_fields_example" # character | All fields returned when true, else only core fields returned. (Optional)
var_label <- "label_example" # character | Filter by label (Optional)
var_nmfs_project_names <- "nmfs_project_names_example" # character | Filter by nmfs_project_names (Optional)
var_value <- "value_example" # character | Filter by value (Optional)

api_instance <- DefaultApi$new()
# to save the result into a file, simply add the optional `data_file` parameter, e.g.
# result <- api_instance$GetBottomTrawlBottomTrawlShelfSlopeSurveyYears(limit = var_limit, fields = var_fields, offset = var_offset, redirect = var_redirect, data_format = var_data_format, response_mode = var_response_mode, include_noncore_fields = var_include_noncore_fields, label = var_label, nmfs_project_names = var_nmfs_project_names, value = var_valuedata_file = "result.txt")
result <- api_instance$GetBottomTrawlBottomTrawlShelfSlopeSurveyYears(limit = var_limit, fields = var_fields, offset = var_offset, redirect = var_redirect, data_format = var_data_format, response_mode = var_response_mode, include_noncore_fields = var_include_noncore_fields, label = var_label, nmfs_project_names = var_nmfs_project_names, value = var_value)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **integer**| Max rows to return | [optional] 
 **fields** | list( **character** )| Comma-separated column filter | [optional] 
 **offset** | **integer**| Rows to skip before beginning to return records. | [optional] 
 **redirect** | **character**| Force S3 pre-signed redirect | [optional] 
 **data_format** | **character**| Response format: json, csv, or parquet | [optional] 
 **response_mode** | **character**| Delivery mode: data, package | [optional] 
 **include_noncore_fields** | **character**| All fields returned when true, else only core fields returned. | [optional] 
 **label** | [**character**](.md)| Filter by label | [optional] 
 **nmfs_project_names** | [**character**](.md)| Filter by nmfs_project_names | [optional] 
 **value** | [**character**](.md)| Filter by value | [optional] 

### Return type

[**array[BottomTrawlBottomTrawlShelfSlopeSurveyYears]**](bottom_trawl_bottom_trawl_shelf_slope_survey_years.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/csv, application/zip, application/vnd.apache.parquet

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Success |  -  |
| **302** | Redirect to S3 for large sets or alternative formats |  * Location - The pre-signed S3 URL <br>  |

# **GetBottomTrawlBottomTrawlShelfSlopeVessels**
> array[BottomTrawlBottomTrawlShelfSlopeVessels] GetBottomTrawlBottomTrawlShelfSlopeVessels(limit = var.limit, fields = var.fields, offset = var.offset, redirect = var.redirect, data_format = var.data_format, response_mode = var.response_mode, include_noncore_fields = var.include_noncore_fields, label = var.label, nmfs_project_names = var.nmfs_project_names, survey_years = var.survey_years, value = var.value)

bottom_trawl_shelf_slope_vessels

A distinct list of all vessels that participated in the shelf/slope bottom trawl survey.

### Example
```R
library(nwfscDataCatalog)

# bottom_trawl_shelf_slope_vessels
#
# prepare function argument(s)
var_limit <- 56 # integer | Max rows to return (Optional)
var_fields <- c("inner_example") # array[character] | Comma-separated column filter (Optional)
var_offset <- 56 # integer | Rows to skip before beginning to return records. (Optional)
var_redirect <- "redirect_example" # character | Force S3 pre-signed redirect (Optional)
var_data_format <- "data_format_example" # character | Response format: json, csv, or parquet (Optional)
var_response_mode <- "response_mode_example" # character | Delivery mode: data, package (Optional)
var_include_noncore_fields <- "include_noncore_fields_example" # character | All fields returned when true, else only core fields returned. (Optional)
var_label <- "label_example" # character | Filter by label (Optional)
var_nmfs_project_names <- "nmfs_project_names_example" # character | Filter by nmfs_project_names (Optional)
var_survey_years <- "survey_years_example" # character | Filter by survey_years (Optional)
var_value <- "value_example" # character | Filter by value (Optional)

api_instance <- DefaultApi$new()
# to save the result into a file, simply add the optional `data_file` parameter, e.g.
# result <- api_instance$GetBottomTrawlBottomTrawlShelfSlopeVessels(limit = var_limit, fields = var_fields, offset = var_offset, redirect = var_redirect, data_format = var_data_format, response_mode = var_response_mode, include_noncore_fields = var_include_noncore_fields, label = var_label, nmfs_project_names = var_nmfs_project_names, survey_years = var_survey_years, value = var_valuedata_file = "result.txt")
result <- api_instance$GetBottomTrawlBottomTrawlShelfSlopeVessels(limit = var_limit, fields = var_fields, offset = var_offset, redirect = var_redirect, data_format = var_data_format, response_mode = var_response_mode, include_noncore_fields = var_include_noncore_fields, label = var_label, nmfs_project_names = var_nmfs_project_names, survey_years = var_survey_years, value = var_value)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **integer**| Max rows to return | [optional] 
 **fields** | list( **character** )| Comma-separated column filter | [optional] 
 **offset** | **integer**| Rows to skip before beginning to return records. | [optional] 
 **redirect** | **character**| Force S3 pre-signed redirect | [optional] 
 **data_format** | **character**| Response format: json, csv, or parquet | [optional] 
 **response_mode** | **character**| Delivery mode: data, package | [optional] 
 **include_noncore_fields** | **character**| All fields returned when true, else only core fields returned. | [optional] 
 **label** | [**character**](.md)| Filter by label | [optional] 
 **nmfs_project_names** | [**character**](.md)| Filter by nmfs_project_names | [optional] 
 **survey_years** | [**character**](.md)| Filter by survey_years | [optional] 
 **value** | [**character**](.md)| Filter by value | [optional] 

### Return type

[**array[BottomTrawlBottomTrawlShelfSlopeVessels]**](bottom_trawl_bottom_trawl_shelf_slope_vessels.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/csv, application/zip, application/vnd.apache.parquet

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Success |  -  |
| **302** | Redirect to S3 for large sets or alternative formats |  * Location - The pre-signed S3 URL <br>  |

# **GetBottomTrawlBottomTrawlSurveyYears**
> array[BottomTrawlBottomTrawlSurveyYears] GetBottomTrawlBottomTrawlSurveyYears(limit = var.limit, fields = var.fields, offset = var.offset, redirect = var.redirect, data_format = var.data_format, response_mode = var.response_mode, include_noncore_fields = var.include_noncore_fields, label = var.label, nmfs_project_names = var.nmfs_project_names, value = var.value)

bottom_trawl_survey_years

A distinct list of all survey years with bottom trawl survey data in the NWFSC database.

### Example
```R
library(nwfscDataCatalog)

# bottom_trawl_survey_years
#
# prepare function argument(s)
var_limit <- 56 # integer | Max rows to return (Optional)
var_fields <- c("inner_example") # array[character] | Comma-separated column filter (Optional)
var_offset <- 56 # integer | Rows to skip before beginning to return records. (Optional)
var_redirect <- "redirect_example" # character | Force S3 pre-signed redirect (Optional)
var_data_format <- "data_format_example" # character | Response format: json, csv, or parquet (Optional)
var_response_mode <- "response_mode_example" # character | Delivery mode: data, package (Optional)
var_include_noncore_fields <- "include_noncore_fields_example" # character | All fields returned when true, else only core fields returned. (Optional)
var_label <- "label_example" # character | Filter by label (Optional)
var_nmfs_project_names <- "nmfs_project_names_example" # character | Filter by nmfs_project_names (Optional)
var_value <- "value_example" # character | Filter by value (Optional)

api_instance <- DefaultApi$new()
# to save the result into a file, simply add the optional `data_file` parameter, e.g.
# result <- api_instance$GetBottomTrawlBottomTrawlSurveyYears(limit = var_limit, fields = var_fields, offset = var_offset, redirect = var_redirect, data_format = var_data_format, response_mode = var_response_mode, include_noncore_fields = var_include_noncore_fields, label = var_label, nmfs_project_names = var_nmfs_project_names, value = var_valuedata_file = "result.txt")
result <- api_instance$GetBottomTrawlBottomTrawlSurveyYears(limit = var_limit, fields = var_fields, offset = var_offset, redirect = var_redirect, data_format = var_data_format, response_mode = var_response_mode, include_noncore_fields = var_include_noncore_fields, label = var_label, nmfs_project_names = var_nmfs_project_names, value = var_value)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **integer**| Max rows to return | [optional] 
 **fields** | list( **character** )| Comma-separated column filter | [optional] 
 **offset** | **integer**| Rows to skip before beginning to return records. | [optional] 
 **redirect** | **character**| Force S3 pre-signed redirect | [optional] 
 **data_format** | **character**| Response format: json, csv, or parquet | [optional] 
 **response_mode** | **character**| Delivery mode: data, package | [optional] 
 **include_noncore_fields** | **character**| All fields returned when true, else only core fields returned. | [optional] 
 **label** | [**character**](.md)| Filter by label | [optional] 
 **nmfs_project_names** | [**character**](.md)| Filter by nmfs_project_names | [optional] 
 **value** | [**character**](.md)| Filter by value | [optional] 

### Return type

[**array[BottomTrawlBottomTrawlSurveyYears]**](bottom_trawl_bottom_trawl_survey_years.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/csv, application/zip, application/vnd.apache.parquet

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Success |  -  |
| **302** | Redirect to S3 for large sets or alternative formats |  * Location - The pre-signed S3 URL <br>  |

# **GetBottomTrawlBottomTrawlTriennialNmfsProjects**
> array[BottomTrawlBottomTrawlTriennialNmfsProjects] GetBottomTrawlBottomTrawlTriennialNmfsProjects(limit = var.limit, fields = var.fields, offset = var.offset, redirect = var.redirect, data_format = var.data_format, response_mode = var.response_mode, include_noncore_fields = var.include_noncore_fields, label = var.label, value = var.value)

bottom_trawl_triennial_nmfs_projects

A distinct list of all bottom trawl surveys.

### Example
```R
library(nwfscDataCatalog)

# bottom_trawl_triennial_nmfs_projects
#
# prepare function argument(s)
var_limit <- 56 # integer | Max rows to return (Optional)
var_fields <- c("inner_example") # array[character] | Comma-separated column filter (Optional)
var_offset <- 56 # integer | Rows to skip before beginning to return records. (Optional)
var_redirect <- "redirect_example" # character | Force S3 pre-signed redirect (Optional)
var_data_format <- "data_format_example" # character | Response format: json, csv, or parquet (Optional)
var_response_mode <- "response_mode_example" # character | Delivery mode: data, package (Optional)
var_include_noncore_fields <- "include_noncore_fields_example" # character | All fields returned when true, else only core fields returned. (Optional)
var_label <- "label_example" # character | Filter by label (Optional)
var_value <- "value_example" # character | Filter by value (Optional)

api_instance <- DefaultApi$new()
# to save the result into a file, simply add the optional `data_file` parameter, e.g.
# result <- api_instance$GetBottomTrawlBottomTrawlTriennialNmfsProjects(limit = var_limit, fields = var_fields, offset = var_offset, redirect = var_redirect, data_format = var_data_format, response_mode = var_response_mode, include_noncore_fields = var_include_noncore_fields, label = var_label, value = var_valuedata_file = "result.txt")
result <- api_instance$GetBottomTrawlBottomTrawlTriennialNmfsProjects(limit = var_limit, fields = var_fields, offset = var_offset, redirect = var_redirect, data_format = var_data_format, response_mode = var_response_mode, include_noncore_fields = var_include_noncore_fields, label = var_label, value = var_value)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **integer**| Max rows to return | [optional] 
 **fields** | list( **character** )| Comma-separated column filter | [optional] 
 **offset** | **integer**| Rows to skip before beginning to return records. | [optional] 
 **redirect** | **character**| Force S3 pre-signed redirect | [optional] 
 **data_format** | **character**| Response format: json, csv, or parquet | [optional] 
 **response_mode** | **character**| Delivery mode: data, package | [optional] 
 **include_noncore_fields** | **character**| All fields returned when true, else only core fields returned. | [optional] 
 **label** | [**character**](.md)| Filter by label | [optional] 
 **value** | [**character**](.md)| Filter by value | [optional] 

### Return type

[**array[BottomTrawlBottomTrawlTriennialNmfsProjects]**](bottom_trawl_bottom_trawl_triennial_nmfs_projects.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/csv, application/zip, application/vnd.apache.parquet

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Success |  -  |
| **302** | Redirect to S3 for large sets or alternative formats |  * Location - The pre-signed S3 URL <br>  |

# **GetBottomTrawlBottomTrawlTriennialSurveyYears**
> array[BottomTrawlBottomTrawlTriennialSurveyYears] GetBottomTrawlBottomTrawlTriennialSurveyYears(limit = var.limit, fields = var.fields, offset = var.offset, redirect = var.redirect, data_format = var.data_format, response_mode = var.response_mode, include_noncore_fields = var.include_noncore_fields, label = var.label, nmfs_project_names = var.nmfs_project_names, value = var.value)

bottom_trawl_triennial_survey_years

A distinct list of all survey years with bottom trawl triennial data in the NWFSC database.

### Example
```R
library(nwfscDataCatalog)

# bottom_trawl_triennial_survey_years
#
# prepare function argument(s)
var_limit <- 56 # integer | Max rows to return (Optional)
var_fields <- c("inner_example") # array[character] | Comma-separated column filter (Optional)
var_offset <- 56 # integer | Rows to skip before beginning to return records. (Optional)
var_redirect <- "redirect_example" # character | Force S3 pre-signed redirect (Optional)
var_data_format <- "data_format_example" # character | Response format: json, csv, or parquet (Optional)
var_response_mode <- "response_mode_example" # character | Delivery mode: data, package (Optional)
var_include_noncore_fields <- "include_noncore_fields_example" # character | All fields returned when true, else only core fields returned. (Optional)
var_label <- "label_example" # character | Filter by label (Optional)
var_nmfs_project_names <- "nmfs_project_names_example" # character | Filter by nmfs_project_names (Optional)
var_value <- "value_example" # character | Filter by value (Optional)

api_instance <- DefaultApi$new()
# to save the result into a file, simply add the optional `data_file` parameter, e.g.
# result <- api_instance$GetBottomTrawlBottomTrawlTriennialSurveyYears(limit = var_limit, fields = var_fields, offset = var_offset, redirect = var_redirect, data_format = var_data_format, response_mode = var_response_mode, include_noncore_fields = var_include_noncore_fields, label = var_label, nmfs_project_names = var_nmfs_project_names, value = var_valuedata_file = "result.txt")
result <- api_instance$GetBottomTrawlBottomTrawlTriennialSurveyYears(limit = var_limit, fields = var_fields, offset = var_offset, redirect = var_redirect, data_format = var_data_format, response_mode = var_response_mode, include_noncore_fields = var_include_noncore_fields, label = var_label, nmfs_project_names = var_nmfs_project_names, value = var_value)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **integer**| Max rows to return | [optional] 
 **fields** | list( **character** )| Comma-separated column filter | [optional] 
 **offset** | **integer**| Rows to skip before beginning to return records. | [optional] 
 **redirect** | **character**| Force S3 pre-signed redirect | [optional] 
 **data_format** | **character**| Response format: json, csv, or parquet | [optional] 
 **response_mode** | **character**| Delivery mode: data, package | [optional] 
 **include_noncore_fields** | **character**| All fields returned when true, else only core fields returned. | [optional] 
 **label** | [**character**](.md)| Filter by label | [optional] 
 **nmfs_project_names** | [**character**](.md)| Filter by nmfs_project_names | [optional] 
 **value** | [**character**](.md)| Filter by value | [optional] 

### Return type

[**array[BottomTrawlBottomTrawlTriennialSurveyYears]**](bottom_trawl_bottom_trawl_triennial_survey_years.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/csv, application/zip, application/vnd.apache.parquet

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Success |  -  |
| **302** | Redirect to S3 for large sets or alternative formats |  * Location - The pre-signed S3 URL <br>  |

# **GetBottomTrawlBottomTrawlTriennialVessels**
> array[BottomTrawlBottomTrawlTriennialVessels] GetBottomTrawlBottomTrawlTriennialVessels(limit = var.limit, fields = var.fields, offset = var.offset, redirect = var.redirect, data_format = var.data_format, response_mode = var.response_mode, include_noncore_fields = var.include_noncore_fields, label = var.label, nmfs_project_names = var.nmfs_project_names, survey_years = var.survey_years, value = var.value)

bottom_trawl_triennial_vessels

A distinct list of all vessels that participated in the bottom trawl triennial surveys.

### Example
```R
library(nwfscDataCatalog)

# bottom_trawl_triennial_vessels
#
# prepare function argument(s)
var_limit <- 56 # integer | Max rows to return (Optional)
var_fields <- c("inner_example") # array[character] | Comma-separated column filter (Optional)
var_offset <- 56 # integer | Rows to skip before beginning to return records. (Optional)
var_redirect <- "redirect_example" # character | Force S3 pre-signed redirect (Optional)
var_data_format <- "data_format_example" # character | Response format: json, csv, or parquet (Optional)
var_response_mode <- "response_mode_example" # character | Delivery mode: data, package (Optional)
var_include_noncore_fields <- "include_noncore_fields_example" # character | All fields returned when true, else only core fields returned. (Optional)
var_label <- "label_example" # character | Filter by label (Optional)
var_nmfs_project_names <- "nmfs_project_names_example" # character | Filter by nmfs_project_names (Optional)
var_survey_years <- "survey_years_example" # character | Filter by survey_years (Optional)
var_value <- "value_example" # character | Filter by value (Optional)

api_instance <- DefaultApi$new()
# to save the result into a file, simply add the optional `data_file` parameter, e.g.
# result <- api_instance$GetBottomTrawlBottomTrawlTriennialVessels(limit = var_limit, fields = var_fields, offset = var_offset, redirect = var_redirect, data_format = var_data_format, response_mode = var_response_mode, include_noncore_fields = var_include_noncore_fields, label = var_label, nmfs_project_names = var_nmfs_project_names, survey_years = var_survey_years, value = var_valuedata_file = "result.txt")
result <- api_instance$GetBottomTrawlBottomTrawlTriennialVessels(limit = var_limit, fields = var_fields, offset = var_offset, redirect = var_redirect, data_format = var_data_format, response_mode = var_response_mode, include_noncore_fields = var_include_noncore_fields, label = var_label, nmfs_project_names = var_nmfs_project_names, survey_years = var_survey_years, value = var_value)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **integer**| Max rows to return | [optional] 
 **fields** | list( **character** )| Comma-separated column filter | [optional] 
 **offset** | **integer**| Rows to skip before beginning to return records. | [optional] 
 **redirect** | **character**| Force S3 pre-signed redirect | [optional] 
 **data_format** | **character**| Response format: json, csv, or parquet | [optional] 
 **response_mode** | **character**| Delivery mode: data, package | [optional] 
 **include_noncore_fields** | **character**| All fields returned when true, else only core fields returned. | [optional] 
 **label** | [**character**](.md)| Filter by label | [optional] 
 **nmfs_project_names** | [**character**](.md)| Filter by nmfs_project_names | [optional] 
 **survey_years** | [**character**](.md)| Filter by survey_years | [optional] 
 **value** | [**character**](.md)| Filter by value | [optional] 

### Return type

[**array[BottomTrawlBottomTrawlTriennialVessels]**](bottom_trawl_bottom_trawl_triennial_vessels.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/csv, application/zip, application/vnd.apache.parquet

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Success |  -  |
| **302** | Redirect to S3 for large sets or alternative formats |  * Location - The pre-signed S3 URL <br>  |

# **GetBottomTrawlBottomTrawlVessels**
> array[BottomTrawlBottomTrawlVessels] GetBottomTrawlBottomTrawlVessels(limit = var.limit, fields = var.fields, offset = var.offset, redirect = var.redirect, data_format = var.data_format, response_mode = var.response_mode, include_noncore_fields = var.include_noncore_fields, label = var.label, nmfs_project_names = var.nmfs_project_names, survey_years = var.survey_years, value = var.value)

bottom_trawl_vessels

A distinct list of all vessels that participated in the bottom trawl survey.

### Example
```R
library(nwfscDataCatalog)

# bottom_trawl_vessels
#
# prepare function argument(s)
var_limit <- 56 # integer | Max rows to return (Optional)
var_fields <- c("inner_example") # array[character] | Comma-separated column filter (Optional)
var_offset <- 56 # integer | Rows to skip before beginning to return records. (Optional)
var_redirect <- "redirect_example" # character | Force S3 pre-signed redirect (Optional)
var_data_format <- "data_format_example" # character | Response format: json, csv, or parquet (Optional)
var_response_mode <- "response_mode_example" # character | Delivery mode: data, package (Optional)
var_include_noncore_fields <- "include_noncore_fields_example" # character | All fields returned when true, else only core fields returned. (Optional)
var_label <- "label_example" # character | Filter by label (Optional)
var_nmfs_project_names <- "nmfs_project_names_example" # character | Filter by nmfs_project_names (Optional)
var_survey_years <- "survey_years_example" # character | Filter by survey_years (Optional)
var_value <- "value_example" # character | Filter by value (Optional)

api_instance <- DefaultApi$new()
# to save the result into a file, simply add the optional `data_file` parameter, e.g.
# result <- api_instance$GetBottomTrawlBottomTrawlVessels(limit = var_limit, fields = var_fields, offset = var_offset, redirect = var_redirect, data_format = var_data_format, response_mode = var_response_mode, include_noncore_fields = var_include_noncore_fields, label = var_label, nmfs_project_names = var_nmfs_project_names, survey_years = var_survey_years, value = var_valuedata_file = "result.txt")
result <- api_instance$GetBottomTrawlBottomTrawlVessels(limit = var_limit, fields = var_fields, offset = var_offset, redirect = var_redirect, data_format = var_data_format, response_mode = var_response_mode, include_noncore_fields = var_include_noncore_fields, label = var_label, nmfs_project_names = var_nmfs_project_names, survey_years = var_survey_years, value = var_value)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **integer**| Max rows to return | [optional] 
 **fields** | list( **character** )| Comma-separated column filter | [optional] 
 **offset** | **integer**| Rows to skip before beginning to return records. | [optional] 
 **redirect** | **character**| Force S3 pre-signed redirect | [optional] 
 **data_format** | **character**| Response format: json, csv, or parquet | [optional] 
 **response_mode** | **character**| Delivery mode: data, package | [optional] 
 **include_noncore_fields** | **character**| All fields returned when true, else only core fields returned. | [optional] 
 **label** | [**character**](.md)| Filter by label | [optional] 
 **nmfs_project_names** | [**character**](.md)| Filter by nmfs_project_names | [optional] 
 **survey_years** | [**character**](.md)| Filter by survey_years | [optional] 
 **value** | [**character**](.md)| Filter by value | [optional] 

### Return type

[**array[BottomTrawlBottomTrawlVessels]**](bottom_trawl_bottom_trawl_vessels.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/csv, application/zip, application/vnd.apache.parquet

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Success |  -  |
| **302** | Redirect to S3 for large sets or alternative formats |  * Location - The pre-signed S3 URL <br>  |

# **GetBottomTrawlCatch**
> array[BottomTrawlCatch] GetBottomTrawlCatch(limit = var.limit, fields = var.fields, offset = var.offset, redirect = var.redirect, data_format = var.data_format, response_mode = var.response_mode, include_noncore_fields = var.include_noncore_fields, actual_station_centroid_key = var.actual_station_centroid_key, actual_station_code = var.actual_station_code, actual_station_current_deactivation_reasons = var.actual_station_current_deactivation_reasons, actual_station_deactivation_year = var.actual_station_deactivation_year, actual_station_depth_stratum_name = var.actual_station_depth_stratum_name, actual_station_latitude_stratum_name = var.actual_station_latitude_stratum_name, best_available_taxon_category = var.best_available_taxon_category, best_available_taxon_common_name = var.best_available_taxon_common_name, best_available_taxon_is_coral = var.best_available_taxon_is_coral, best_available_taxon_is_invertebrate = var.best_available_taxon_is_invertebrate, best_available_taxon_is_pacific_salmon = var.best_available_taxon_is_pacific_salmon, best_available_taxon_is_rockfish = var.best_available_taxon_is_rockfish, best_available_taxon_is_sponge = var.best_available_taxon_is_sponge, best_available_taxon_itis_tsn = var.best_available_taxon_itis_tsn, best_available_taxon_scientific_name = var.best_available_taxon_scientific_name, best_available_taxon_subcategory = var.best_available_taxon_subcategory, best_available_taxon_worms_aphia_id = var.best_available_taxon_worms_aphia_id, best_tow_latitude_dd = var.best_tow_latitude_dd, best_tow_longitude_dd = var.best_tow_longitude_dd, bottom_trawl_operation_key = var.bottom_trawl_operation_key, data_readiness_level_code = var.data_readiness_level_code, data_readiness_level_display_name = var.data_readiness_level_display_name, data_status_name = var.data_status_name, field_identified_common_name = var.field_identified_common_name, field_identified_scientific_name = var.field_identified_scientific_name, is_actual_station_currently_active = var.is_actual_station_currently_active, leg_number = var.leg_number, life_stage_name = var.life_stage_name, net_off_bottom_at = var.net_off_bottom_at, net_on_bottom_at = var.net_on_bottom_at, nmfs_project_name = var.nmfs_project_name, pass_number = var.pass_number, sampled_catch_individuals_count = var.sampled_catch_individuals_count, sampled_catch_weight_kg = var.sampled_catch_weight_kg, sampling_date = var.sampling_date, source_wcgbts_id = var.source_wcgbts_id, survey_year = var.survey_year, total_catch_individuals_count = var.total_catch_individuals_count, total_catch_weight_kg = var.total_catch_weight_kg, tow_performance_name = var.tow_performance_name, vessel_name = var.vessel_name, was_actual_station_active_when_sampled = var.was_actual_station_active_when_sampled, was_target_station_active_when_sampled = var.was_target_station_active_when_sampled)

West Coast Bottom Trawl Catch Samples

Report storing one record per catch sample sorted out to its taxonomic classification sampled on all bottom trawl tows. A typical catch sample can be defined as having:     * **A.** A taxonomic classification or marine debris designation  * **B.** Total weight of the sample, and subsample weight if one is taken  * **C.** Total individual organism tally (extrapolated or actual) and subsample tally if one is taken    Depending on sampling protocols for a given species and amount caught, all individuals in a sample are tallied, or the catch is subsampled, with the entire sample being weighed but only a portion of the individuals tallied. In the event of an incomplete tally, the total individuals estimated for the catch is calculated by:    1. Finding the average weight per fish from individuals that are both weighed and counted.  2. Using that average weight per fish to estimate a tally for the uncounted portion.    > **Note:** Taxonomic classifications may change post-season due to indeterminate field ID, genetic analysis, etc., and are represented in this report by both `field_identified` and `best_available` taxonomic designations.

### Example
```R
library(nwfscDataCatalog)

# West Coast Bottom Trawl Catch Samples
#
# prepare function argument(s)
var_limit <- 56 # integer | Max rows to return (Optional)
var_fields <- c("inner_example") # array[character] | Comma-separated column filter (Optional)
var_offset <- 56 # integer | Rows to skip before beginning to return records. (Optional)
var_redirect <- "redirect_example" # character | Force S3 pre-signed redirect (Optional)
var_data_format <- "data_format_example" # character | Response format: json, csv, or parquet (Optional)
var_response_mode <- "response_mode_example" # character | Delivery mode: data, package (Optional)
var_include_noncore_fields <- "include_noncore_fields_example" # character | All fields returned when true, else only core fields returned. (Optional)
var_actual_station_centroid_key <- "actual_station_centroid_key_example" # character | A composite spatial key that uniquely identifies the centroid of a WCGBTS (West Coast Groundfish Bottom Trawl Survey) sampling station grid cell.     This key is a fixed 8-character string constructed by converting decimal degree coordinates into Degrees and Decimal Minutes (DDM), stripping away negative signs and truncating specific digits to create a consistent spatial identifier.    ### Component Breakdown  The 8-character format strictly follows the pattern **`[Lat Degrees][Lat Minutes][Lon Degrees][Lon Minutes]`**:    * **Latitude Degrees (2 characters):** The whole number of the decimal latitude (e.g., `43.58` becomes `43`).  * **Latitude Minutes (2 characters):** The decimal remainder of the latitude multiplied by 60 and rounded to the nearest whole number (e.g., `0.58139 * 60 = 34.88`, which rounds to `35`).  * **Longitude Degrees (2 characters):** The whole number of the longitude, ignoring the negative sign (West) and dropping the leading hundreds place (e.g., `-124.61` becomes `24`).  * **Longitude Minutes (2 characters):** The decimal remainder of the longitude multiplied by 60 and rounded to the nearest whole number (e.g., `0.61465 * 60 = 36.87`, which rounds to `37`).    > **Example:** A grid cell centroid located at decimal coordinates **`43.58139678, -124.61465068`** results in the centroid key **`43352437`**. (Optional)
var_actual_station_code <- "actual_station_code_example" # character | Unique identifier for the sampling site visited. For the West Coast Groundfish Bottom Trawl Shelf/Slope Survey, sites follow a gridded pattern. Site codes incrementing sequentially by one from North to South and West to East, with the site furthest to the North starting at 4039 and the site furthest to the south ending at 23399. Most site codes are integers, but present as text data types to accommodate historical formats which included alphanumeric values. Historical site splits are represented by floating point numbers (site 44444 split to 44444.1 and 44444.2). The \"best\" sampling site designation indicates that the single summarized tow/haul location falls within this site boundary. The \"target\" site may diverge from the \"best\" in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to this preferred geolocated site. (Optional)
var_actual_station_current_deactivation_reasons <- "actual_station_current_deactivation_reasons_example" # character | Comma-separated list of current reasons that a station is listed as inactive.  Value should be null unless the station is currently inactive. (Optional)
var_actual_station_deactivation_year <- "actual_station_deactivation_year_example" # character | The year YYYY when the actual station sampled was last deactivated, if the site is currently inactive. The \"best\" sampling site designation indicates that the single summarized tow/haul location falls within this site boundary. The \"target\" site may diverge from the \"best\" in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to this preferred geolocated site. (Optional)
var_actual_station_depth_stratum_name <- "actual_station_depth_stratum_name_example" # character | Name of the depth stratum that the sampling site falls into. Sampling on the West Coast Groundfish Bottom Trawl Shelf/Slope Survey follows a randomly stratified design, with sampling sites falling into one of three depth strata: 30-100 fathoms, 100-300 fathoms, and 300-700 fathoms. The \"best\" sampling site designation indicates that the single summarized tow/haul location falls within this site boundary. The \"target\" site may diverge from the \"best\" in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to this preferred geolocated site. (Optional)
var_actual_station_latitude_stratum_name <- "actual_station_latitude_stratum_name_example" # character | Name of the latitude stratum that the sampling site falls into. Sampling on the West Coast Groundfish Bottom Trawl Shelf/Slope Survey follows a randomly stratified design, with sampling sites falling into one of two latitude strata: North of Point Conception (>34°30'N) or South of Point Conception (<34°30'N). The \"best\" sampling site designation indicates that the single summarized tow/haul location falls within this site boundary. The \"target\" site may diverge from the \"best\" in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to this preferred geolocated site. (Optional)
var_best_available_taxon_category <- "best_available_taxon_category_example" # character | Broad scientific category of the taxon (e.g., Fish, Invertebrate, Mammal, Marine Plant). \"Best available\" designation reflects the taxonomic classification of the species after postseason review, which may be the same or different than the taxonomic classification determined in the field at time of collection. (Optional)
var_best_available_taxon_common_name <- "best_available_taxon_common_name_example" # character | Common name of the species preferred by the Northwest Fisheries Science Center. \"Best available\" designation reflects the taxonomic classification of the species after postseason review, which may be the same or different than the taxonomic classification determined in the field at time of collection. (Optional)
var_best_available_taxon_is_coral <- "best_available_taxon_is_coral_example" # character | Boolean flag indicating if the taxon belongs to the subclass Octocorallia (corals). \"Best available\" designation reflects the taxonomic classification of the species after postseason review, which may be the same or different than the taxonomic classification determined in the field at time of collection. (Optional)
var_best_available_taxon_is_invertebrate <- "best_available_taxon_is_invertebrate_example" # character | Boolean flag indicating if the taxon is an invertebrate (Kingdom Animalia, excluding Subphylum Vertebrata). \"Best available\" designation reflects the taxonomic classification of the species after postseason review, which may be the same or different than the taxonomic classification determined in the field at time of collection. (Optional)
var_best_available_taxon_is_pacific_salmon <- "best_available_taxon_is_pacific_salmon_example" # character | Boolean flag indicating if the taxon belongs to the genus Oncorhynchus (Pacific salmon). \"Best available\" designation reflects the taxonomic classification of the species after postseason review, which may be the same or different than the taxonomic classification determined in the field at time of collection. (Optional)
var_best_available_taxon_is_rockfish <- "best_available_taxon_is_rockfish_example" # character | Boolean flag indicating if the taxon belongs to the genus Sebastes (rockfishes). \"Best available\" designation reflects the taxonomic classification of the species after postseason review, which may be the same or different than the taxonomic classification determined in the field at time of collection. (Optional)
var_best_available_taxon_is_sponge <- "best_available_taxon_is_sponge_example" # character | Boolean flag indicating if the taxon belongs to the phylum Porifera (sponges). \"Best available\" designation reflects the taxonomic classification of the species after postseason review, which may be the same or different than the taxonomic classification determined in the field at time of collection. (Optional)
var_best_available_taxon_itis_tsn <- "best_available_taxon_itis_tsn_example" # character | Taxonomic Serial Number (TSN) is a unique, stable, and persistent numeric identifier assigned by the Integrated Taxonomic Information System (ITIS) to scientific names of organisms. It serves as a non-intelligent, permanent key for tracking species, synonyms, and taxonomic changes across various databases, ensuring standardized classification of flora and fauna. \"Best available\" designation reflects the taxonomic classification of the species after postseason review, which may be the same or different than the taxonomic classification determined in the field at time of collection. (Optional)
var_best_available_taxon_scientific_name <- "best_available_taxon_scientific_name_example" # character | Scientific name or latinized nomenclature of the species caught used to uniquely identify taxonomic classification. \"Best available\" designation reflects the taxonomic classification of the species after postseason review, which may be the same or different than the taxonomic classification determined in the field at time of collection. (Optional)
var_best_available_taxon_subcategory <- "best_available_taxon_subcategory_example" # character | More granular scientific subcategory of the taxon (e.g., Rockfish, Flatfish, Roundfish, Crab, Shrimp). \"Best available\" designation reflects the taxonomic classification of the species after postseason review, which may be the same or different than the taxonomic classification determined in the field at time of collection. (Optional)
var_best_available_taxon_worms_aphia_id <- "best_available_taxon_worms_aphia_id_example" # character | The AphiaID is a unique, stable, and persistent numerical identifier used within the World Register of Marine Species (WoRMS) database to identify, track, and manage marine organisms, including their taxonomic classification, synonyms, and related biological traits. It serves as the core taxonomic infrastructure, ensuring data consistency and enabling integration with external biological databases. \"Best available\" designation reflects the taxonomic classification of the species after postseason review, which may be the same or different than the taxonomic classification determined in the field at time of collection. (Optional)
var_best_tow_latitude_dd <- "best_tow_latitude_dd_example" # character | Summarized location of the tow representing the single point in space that best represents where the tow sampling took place. Typically this location is derived by combining the median latitude and longitude of the estimated gear track wihle the gear is fishing and in contact with the bottom. Latitude presented as decimal degrees with up to eight points of precision. Latitude presented as decimal degrees with up to eight points of precision. (Optional)
var_best_tow_longitude_dd <- "best_tow_longitude_dd_example" # character | Summarized location of the tow representing the single point in space that best represents where the tow sampling took place. Typically this location is derived by combining the median latitude and longitude of the estimated gear track wihle the gear is fishing and in contact with the bottom. Longitude presented as decimal degrees with up to eight points of precision. Longitude presented as decimal degrees with up to eight points of precision. (Optional)
var_bottom_trawl_operation_key <- "bottom_trawl_operation_key_example" # character | 12-character numeric unique identifier for a West Coast Groundfish Bottom Trawl sampling operation. Digits 1-4 represent the year (YYYY) of sampling, digits 5-6 represent the survey operation type, digits 7-9 represent the zero-padded vessel identifier, digits 10-12 represent the zero-padded sequential operation increment. (Optional)
var_data_readiness_level_code <- "data_readiness_level_code_example" # character | The code representing the data readiness level.     Values include:  * `L0`  * `L1`  * `L2`  * `L3`  * `L4` (Optional)
var_data_readiness_level_display_name <- "data_readiness_level_display_name_example" # character | The formatted display name combining the readiness level code and its status.     Values include:  * `L0 - RAW`  * `L1 - PRELIMINARY`  * `L2 - VERIFIED`  * `L3 - HARMONIZED`  * `L4 - DERIVED` (Optional)
var_data_status_name <- "data_status_name_example" # character | Name of the data point's current status with respect to its finalization/QC status.  Typically new data submitted directly from the field is flagged as \"Under Review\",   until it is reviewed, where it is then marked as \"Finalized\".  Unfinalized data may  be used for any purpose, but for fisheries stock assessment, using/filtering for  finalized data is best. (Optional)
var_field_identified_common_name <- "field_identified_common_name_example" # character | Common name of the species preferred by the Northwest Fisheries Science Center. \"Field identified\" designation reflects the taxonomic classification of the species/organism at time of collection in the field. (Optional)
var_field_identified_scientific_name <- "field_identified_scientific_name_example" # character | Scientific name or latinized nomenclature of the species caught used to uniquely identify taxonomic classification. \"Field identified\" designation reflects the taxonomic classification of the species/organism at time of collection in the field. (Optional)
var_is_actual_station_currently_active <- "is_actual_station_currently_active_example" # character | Boolean indicating if the actual station sampled is currently active. The \"best\" sampling site designation indicates that the single summarized tow/haul location falls within this site boundary. The \"target\" site may diverge from the \"best\" in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to this preferred geolocated site. (Optional)
var_leg_number <- "leg_number_example" # character | Leg increment number when a sampling operation took place.  Each vessel participating in the survey partakes in multiple legs (leg #1, #2...) as part of the survey schedule within a given pass, with each survey containing multiple passes per year.  A vessel on the WCGBTS Shelf/Slope Survey typically is scheduled for 5 legs per year, although this is subject to change due to year-to-year schedule differences. (Optional)
var_life_stage_name <- "life_stage_name_example" # character | Life stage or ontogeny designation of the catch sample (i.e. egg case, larval, adult, YoY).  If not specified (it typically is not called out by scientists in the field) the catch can be assumed to be fully mature adults. (Optional)
var_net_off_bottom_at <- "net_off_bottom_at_example" # character | Date and time when the footrope loses contact with the bottom after haulback has begun, marking the end of \"sampling\" / \"fishing\" for the tow. UTC Date and time with timezone offset following in ISO 8601 (`YYYY-MM-DD HH:MM:SS+00`). Timestamp is to seconds precision (no fractional seconds). (Optional)
var_net_on_bottom_at <- "net_on_bottom_at_example" # character | Date and time when the footrope initially makes contact with the bottom, marking the start of \"sampling\" / \"fishing\" for the tow. UTC Date and time with timezone offset following in ISO 8601 (`YYYY-MM-DD HH:MM:SS+00`). Timestamp is to seconds precision (no fractional seconds). (Optional)
var_nmfs_project_name <- "nmfs_project_name_example" # character | Name of the project/survey under the National Marine Fisheries Service (NMFS) for which the data was collected. (Optional)
var_pass_number <- "pass_number_example" # character | Pass increment number when a sampling operation took place (i.e. pass #1, #2...).  Each annual survey typically has multiple passes, with each pass being assigned one or several vessels to participate in sampling. (Optional)
var_sampled_catch_individuals_count <- "sampled_catch_individuals_count_example" # character | Tally of individual organisms that were physically counted in the catch sample. (Optional)
var_sampled_catch_weight_kg <- "sampled_catch_weight_kg_example" # character | Sample weight of the catch in kilograms that was physically measured. (Optional)
var_sampling_date <- "sampling_date_example" # character | Date when sampling took place, in YYYY-MM-DD ISO8601 format (Optional)
var_source_wcgbts_id <- "source_wcgbts_id_example" # character | Source catch UUID (v7) identifier for the record sources from the field WCGBTS database. (Optional)
var_survey_year <- "survey_year_example" # character | Calendar year in integer format YYYY during which data was collected. (Optional)
var_total_catch_individuals_count <- "total_catch_individuals_count_example" # character | Total estimated tally of individual organisms from the catch sample.  Unless all individuals are counted, the total tally of individuals in the catch sample is extrapolated using the average weight per individual from the physically weighed/tallied sample.  For example, if 100kg of canary rockfish is weighed, but only 8 individuals weighing 16kg were tallied, we'd assume a total tally in the sample of 50 indiviauls (100kg / 2kg per fish).  Fractional individuals are rounded up (i.e. estimated tally = 12.3 ==> 13 fish). (Optional)
var_total_catch_weight_kg <- "total_catch_weight_kg_example" # character | Total weight of the catch sample in kilograms.  This value often matches the physically weighed weight, but may diverge if the scientist decides to subsample the whole due to logistical or time constraints.  In this scenario the total catch weight is extrapolated using the proportion of the species from the subsample with respect to other species in that same total sample. (Optional)
var_tow_performance_name <- "tow_performance_name_example" # character | Tows should be marked as \"satisfactory\" or \"unsatisfactory\", with satisfactory tows typically considered viable for stock assessment. (Optional)
var_vessel_name <- "vessel_name_example" # character | Full name of the commercial or research vessel used to collect the data at sea. (Optional)
var_was_actual_station_active_when_sampled <- "was_actual_station_active_when_sampled_example" # character | Boolean indicating if the actual station was active at the time it was sampled. The \"best\" sampling site designation indicates that the single summarized tow/haul location falls within this site boundary. The \"target\" site may diverge from the \"best\" in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to this preferred geolocated site. (Optional)
var_was_target_station_active_when_sampled <- "was_target_station_active_when_sampled_example" # character | Boolean indicating if the target station was active at the time of sampling. The \"target\" sampling site designation indicates that the site was the target for sampling for the particular operation. The \"target\" site may diverge from the \"best\" in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to the \"best\" preferred geolocated site. (Optional)

api_instance <- DefaultApi$new()
# to save the result into a file, simply add the optional `data_file` parameter, e.g.
# result <- api_instance$GetBottomTrawlCatch(limit = var_limit, fields = var_fields, offset = var_offset, redirect = var_redirect, data_format = var_data_format, response_mode = var_response_mode, include_noncore_fields = var_include_noncore_fields, actual_station_centroid_key = var_actual_station_centroid_key, actual_station_code = var_actual_station_code, actual_station_current_deactivation_reasons = var_actual_station_current_deactivation_reasons, actual_station_deactivation_year = var_actual_station_deactivation_year, actual_station_depth_stratum_name = var_actual_station_depth_stratum_name, actual_station_latitude_stratum_name = var_actual_station_latitude_stratum_name, best_available_taxon_category = var_best_available_taxon_category, best_available_taxon_common_name = var_best_available_taxon_common_name, best_available_taxon_is_coral = var_best_available_taxon_is_coral, best_available_taxon_is_invertebrate = var_best_available_taxon_is_invertebrate, best_available_taxon_is_pacific_salmon = var_best_available_taxon_is_pacific_salmon, best_available_taxon_is_rockfish = var_best_available_taxon_is_rockfish, best_available_taxon_is_sponge = var_best_available_taxon_is_sponge, best_available_taxon_itis_tsn = var_best_available_taxon_itis_tsn, best_available_taxon_scientific_name = var_best_available_taxon_scientific_name, best_available_taxon_subcategory = var_best_available_taxon_subcategory, best_available_taxon_worms_aphia_id = var_best_available_taxon_worms_aphia_id, best_tow_latitude_dd = var_best_tow_latitude_dd, best_tow_longitude_dd = var_best_tow_longitude_dd, bottom_trawl_operation_key = var_bottom_trawl_operation_key, data_readiness_level_code = var_data_readiness_level_code, data_readiness_level_display_name = var_data_readiness_level_display_name, data_status_name = var_data_status_name, field_identified_common_name = var_field_identified_common_name, field_identified_scientific_name = var_field_identified_scientific_name, is_actual_station_currently_active = var_is_actual_station_currently_active, leg_number = var_leg_number, life_stage_name = var_life_stage_name, net_off_bottom_at = var_net_off_bottom_at, net_on_bottom_at = var_net_on_bottom_at, nmfs_project_name = var_nmfs_project_name, pass_number = var_pass_number, sampled_catch_individuals_count = var_sampled_catch_individuals_count, sampled_catch_weight_kg = var_sampled_catch_weight_kg, sampling_date = var_sampling_date, source_wcgbts_id = var_source_wcgbts_id, survey_year = var_survey_year, total_catch_individuals_count = var_total_catch_individuals_count, total_catch_weight_kg = var_total_catch_weight_kg, tow_performance_name = var_tow_performance_name, vessel_name = var_vessel_name, was_actual_station_active_when_sampled = var_was_actual_station_active_when_sampled, was_target_station_active_when_sampled = var_was_target_station_active_when_sampleddata_file = "result.txt")
result <- api_instance$GetBottomTrawlCatch(limit = var_limit, fields = var_fields, offset = var_offset, redirect = var_redirect, data_format = var_data_format, response_mode = var_response_mode, include_noncore_fields = var_include_noncore_fields, actual_station_centroid_key = var_actual_station_centroid_key, actual_station_code = var_actual_station_code, actual_station_current_deactivation_reasons = var_actual_station_current_deactivation_reasons, actual_station_deactivation_year = var_actual_station_deactivation_year, actual_station_depth_stratum_name = var_actual_station_depth_stratum_name, actual_station_latitude_stratum_name = var_actual_station_latitude_stratum_name, best_available_taxon_category = var_best_available_taxon_category, best_available_taxon_common_name = var_best_available_taxon_common_name, best_available_taxon_is_coral = var_best_available_taxon_is_coral, best_available_taxon_is_invertebrate = var_best_available_taxon_is_invertebrate, best_available_taxon_is_pacific_salmon = var_best_available_taxon_is_pacific_salmon, best_available_taxon_is_rockfish = var_best_available_taxon_is_rockfish, best_available_taxon_is_sponge = var_best_available_taxon_is_sponge, best_available_taxon_itis_tsn = var_best_available_taxon_itis_tsn, best_available_taxon_scientific_name = var_best_available_taxon_scientific_name, best_available_taxon_subcategory = var_best_available_taxon_subcategory, best_available_taxon_worms_aphia_id = var_best_available_taxon_worms_aphia_id, best_tow_latitude_dd = var_best_tow_latitude_dd, best_tow_longitude_dd = var_best_tow_longitude_dd, bottom_trawl_operation_key = var_bottom_trawl_operation_key, data_readiness_level_code = var_data_readiness_level_code, data_readiness_level_display_name = var_data_readiness_level_display_name, data_status_name = var_data_status_name, field_identified_common_name = var_field_identified_common_name, field_identified_scientific_name = var_field_identified_scientific_name, is_actual_station_currently_active = var_is_actual_station_currently_active, leg_number = var_leg_number, life_stage_name = var_life_stage_name, net_off_bottom_at = var_net_off_bottom_at, net_on_bottom_at = var_net_on_bottom_at, nmfs_project_name = var_nmfs_project_name, pass_number = var_pass_number, sampled_catch_individuals_count = var_sampled_catch_individuals_count, sampled_catch_weight_kg = var_sampled_catch_weight_kg, sampling_date = var_sampling_date, source_wcgbts_id = var_source_wcgbts_id, survey_year = var_survey_year, total_catch_individuals_count = var_total_catch_individuals_count, total_catch_weight_kg = var_total_catch_weight_kg, tow_performance_name = var_tow_performance_name, vessel_name = var_vessel_name, was_actual_station_active_when_sampled = var_was_actual_station_active_when_sampled, was_target_station_active_when_sampled = var_was_target_station_active_when_sampled)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **integer**| Max rows to return | [optional] 
 **fields** | list( **character** )| Comma-separated column filter | [optional] 
 **offset** | **integer**| Rows to skip before beginning to return records. | [optional] 
 **redirect** | **character**| Force S3 pre-signed redirect | [optional] 
 **data_format** | **character**| Response format: json, csv, or parquet | [optional] 
 **response_mode** | **character**| Delivery mode: data, package | [optional] 
 **include_noncore_fields** | **character**| All fields returned when true, else only core fields returned. | [optional] 
 **actual_station_centroid_key** | [**character**](.md)| A composite spatial key that uniquely identifies the centroid of a WCGBTS (West Coast Groundfish Bottom Trawl Survey) sampling station grid cell.     This key is a fixed 8-character string constructed by converting decimal degree coordinates into Degrees and Decimal Minutes (DDM), stripping away negative signs and truncating specific digits to create a consistent spatial identifier.    ### Component Breakdown  The 8-character format strictly follows the pattern **&#x60;[Lat Degrees][Lat Minutes][Lon Degrees][Lon Minutes]&#x60;**:    * **Latitude Degrees (2 characters):** The whole number of the decimal latitude (e.g., &#x60;43.58&#x60; becomes &#x60;43&#x60;).  * **Latitude Minutes (2 characters):** The decimal remainder of the latitude multiplied by 60 and rounded to the nearest whole number (e.g., &#x60;0.58139 * 60 &#x3D; 34.88&#x60;, which rounds to &#x60;35&#x60;).  * **Longitude Degrees (2 characters):** The whole number of the longitude, ignoring the negative sign (West) and dropping the leading hundreds place (e.g., &#x60;-124.61&#x60; becomes &#x60;24&#x60;).  * **Longitude Minutes (2 characters):** The decimal remainder of the longitude multiplied by 60 and rounded to the nearest whole number (e.g., &#x60;0.61465 * 60 &#x3D; 36.87&#x60;, which rounds to &#x60;37&#x60;).    &gt; **Example:** A grid cell centroid located at decimal coordinates **&#x60;43.58139678, -124.61465068&#x60;** results in the centroid key **&#x60;43352437&#x60;**. | [optional] 
 **actual_station_code** | [**character**](.md)| Unique identifier for the sampling site visited. For the West Coast Groundfish Bottom Trawl Shelf/Slope Survey, sites follow a gridded pattern. Site codes incrementing sequentially by one from North to South and West to East, with the site furthest to the North starting at 4039 and the site furthest to the south ending at 23399. Most site codes are integers, but present as text data types to accommodate historical formats which included alphanumeric values. Historical site splits are represented by floating point numbers (site 44444 split to 44444.1 and 44444.2). The \&quot;best\&quot; sampling site designation indicates that the single summarized tow/haul location falls within this site boundary. The \&quot;target\&quot; site may diverge from the \&quot;best\&quot; in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to this preferred geolocated site. | [optional] 
 **actual_station_current_deactivation_reasons** | [**character**](.md)| Comma-separated list of current reasons that a station is listed as inactive.  Value should be null unless the station is currently inactive. | [optional] 
 **actual_station_deactivation_year** | [**character**](.md)| The year YYYY when the actual station sampled was last deactivated, if the site is currently inactive. The \&quot;best\&quot; sampling site designation indicates that the single summarized tow/haul location falls within this site boundary. The \&quot;target\&quot; site may diverge from the \&quot;best\&quot; in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to this preferred geolocated site. | [optional] 
 **actual_station_depth_stratum_name** | [**character**](.md)| Name of the depth stratum that the sampling site falls into. Sampling on the West Coast Groundfish Bottom Trawl Shelf/Slope Survey follows a randomly stratified design, with sampling sites falling into one of three depth strata: 30-100 fathoms, 100-300 fathoms, and 300-700 fathoms. The \&quot;best\&quot; sampling site designation indicates that the single summarized tow/haul location falls within this site boundary. The \&quot;target\&quot; site may diverge from the \&quot;best\&quot; in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to this preferred geolocated site. | [optional] 
 **actual_station_latitude_stratum_name** | [**character**](.md)| Name of the latitude stratum that the sampling site falls into. Sampling on the West Coast Groundfish Bottom Trawl Shelf/Slope Survey follows a randomly stratified design, with sampling sites falling into one of two latitude strata: North of Point Conception (&gt;34°30&#39;N) or South of Point Conception (&lt;34°30&#39;N). The \&quot;best\&quot; sampling site designation indicates that the single summarized tow/haul location falls within this site boundary. The \&quot;target\&quot; site may diverge from the \&quot;best\&quot; in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to this preferred geolocated site. | [optional] 
 **best_available_taxon_category** | [**character**](.md)| Broad scientific category of the taxon (e.g., Fish, Invertebrate, Mammal, Marine Plant). \&quot;Best available\&quot; designation reflects the taxonomic classification of the species after postseason review, which may be the same or different than the taxonomic classification determined in the field at time of collection. | [optional] 
 **best_available_taxon_common_name** | [**character**](.md)| Common name of the species preferred by the Northwest Fisheries Science Center. \&quot;Best available\&quot; designation reflects the taxonomic classification of the species after postseason review, which may be the same or different than the taxonomic classification determined in the field at time of collection. | [optional] 
 **best_available_taxon_is_coral** | [**character**](.md)| Boolean flag indicating if the taxon belongs to the subclass Octocorallia (corals). \&quot;Best available\&quot; designation reflects the taxonomic classification of the species after postseason review, which may be the same or different than the taxonomic classification determined in the field at time of collection. | [optional] 
 **best_available_taxon_is_invertebrate** | [**character**](.md)| Boolean flag indicating if the taxon is an invertebrate (Kingdom Animalia, excluding Subphylum Vertebrata). \&quot;Best available\&quot; designation reflects the taxonomic classification of the species after postseason review, which may be the same or different than the taxonomic classification determined in the field at time of collection. | [optional] 
 **best_available_taxon_is_pacific_salmon** | [**character**](.md)| Boolean flag indicating if the taxon belongs to the genus Oncorhynchus (Pacific salmon). \&quot;Best available\&quot; designation reflects the taxonomic classification of the species after postseason review, which may be the same or different than the taxonomic classification determined in the field at time of collection. | [optional] 
 **best_available_taxon_is_rockfish** | [**character**](.md)| Boolean flag indicating if the taxon belongs to the genus Sebastes (rockfishes). \&quot;Best available\&quot; designation reflects the taxonomic classification of the species after postseason review, which may be the same or different than the taxonomic classification determined in the field at time of collection. | [optional] 
 **best_available_taxon_is_sponge** | [**character**](.md)| Boolean flag indicating if the taxon belongs to the phylum Porifera (sponges). \&quot;Best available\&quot; designation reflects the taxonomic classification of the species after postseason review, which may be the same or different than the taxonomic classification determined in the field at time of collection. | [optional] 
 **best_available_taxon_itis_tsn** | [**character**](.md)| Taxonomic Serial Number (TSN) is a unique, stable, and persistent numeric identifier assigned by the Integrated Taxonomic Information System (ITIS) to scientific names of organisms. It serves as a non-intelligent, permanent key for tracking species, synonyms, and taxonomic changes across various databases, ensuring standardized classification of flora and fauna. \&quot;Best available\&quot; designation reflects the taxonomic classification of the species after postseason review, which may be the same or different than the taxonomic classification determined in the field at time of collection. | [optional] 
 **best_available_taxon_scientific_name** | [**character**](.md)| Scientific name or latinized nomenclature of the species caught used to uniquely identify taxonomic classification. \&quot;Best available\&quot; designation reflects the taxonomic classification of the species after postseason review, which may be the same or different than the taxonomic classification determined in the field at time of collection. | [optional] 
 **best_available_taxon_subcategory** | [**character**](.md)| More granular scientific subcategory of the taxon (e.g., Rockfish, Flatfish, Roundfish, Crab, Shrimp). \&quot;Best available\&quot; designation reflects the taxonomic classification of the species after postseason review, which may be the same or different than the taxonomic classification determined in the field at time of collection. | [optional] 
 **best_available_taxon_worms_aphia_id** | [**character**](.md)| The AphiaID is a unique, stable, and persistent numerical identifier used within the World Register of Marine Species (WoRMS) database to identify, track, and manage marine organisms, including their taxonomic classification, synonyms, and related biological traits. It serves as the core taxonomic infrastructure, ensuring data consistency and enabling integration with external biological databases. \&quot;Best available\&quot; designation reflects the taxonomic classification of the species after postseason review, which may be the same or different than the taxonomic classification determined in the field at time of collection. | [optional] 
 **best_tow_latitude_dd** | [**character**](.md)| Summarized location of the tow representing the single point in space that best represents where the tow sampling took place. Typically this location is derived by combining the median latitude and longitude of the estimated gear track wihle the gear is fishing and in contact with the bottom. Latitude presented as decimal degrees with up to eight points of precision. Latitude presented as decimal degrees with up to eight points of precision. | [optional] 
 **best_tow_longitude_dd** | [**character**](.md)| Summarized location of the tow representing the single point in space that best represents where the tow sampling took place. Typically this location is derived by combining the median latitude and longitude of the estimated gear track wihle the gear is fishing and in contact with the bottom. Longitude presented as decimal degrees with up to eight points of precision. Longitude presented as decimal degrees with up to eight points of precision. | [optional] 
 **bottom_trawl_operation_key** | [**character**](.md)| 12-character numeric unique identifier for a West Coast Groundfish Bottom Trawl sampling operation. Digits 1-4 represent the year (YYYY) of sampling, digits 5-6 represent the survey operation type, digits 7-9 represent the zero-padded vessel identifier, digits 10-12 represent the zero-padded sequential operation increment. | [optional] 
 **data_readiness_level_code** | [**character**](.md)| The code representing the data readiness level.     Values include:  * &#x60;L0&#x60;  * &#x60;L1&#x60;  * &#x60;L2&#x60;  * &#x60;L3&#x60;  * &#x60;L4&#x60; | [optional] 
 **data_readiness_level_display_name** | [**character**](.md)| The formatted display name combining the readiness level code and its status.     Values include:  * &#x60;L0 - RAW&#x60;  * &#x60;L1 - PRELIMINARY&#x60;  * &#x60;L2 - VERIFIED&#x60;  * &#x60;L3 - HARMONIZED&#x60;  * &#x60;L4 - DERIVED&#x60; | [optional] 
 **data_status_name** | [**character**](.md)| Name of the data point&#39;s current status with respect to its finalization/QC status.  Typically new data submitted directly from the field is flagged as \&quot;Under Review\&quot;,   until it is reviewed, where it is then marked as \&quot;Finalized\&quot;.  Unfinalized data may  be used for any purpose, but for fisheries stock assessment, using/filtering for  finalized data is best. | [optional] 
 **field_identified_common_name** | [**character**](.md)| Common name of the species preferred by the Northwest Fisheries Science Center. \&quot;Field identified\&quot; designation reflects the taxonomic classification of the species/organism at time of collection in the field. | [optional] 
 **field_identified_scientific_name** | [**character**](.md)| Scientific name or latinized nomenclature of the species caught used to uniquely identify taxonomic classification. \&quot;Field identified\&quot; designation reflects the taxonomic classification of the species/organism at time of collection in the field. | [optional] 
 **is_actual_station_currently_active** | [**character**](.md)| Boolean indicating if the actual station sampled is currently active. The \&quot;best\&quot; sampling site designation indicates that the single summarized tow/haul location falls within this site boundary. The \&quot;target\&quot; site may diverge from the \&quot;best\&quot; in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to this preferred geolocated site. | [optional] 
 **leg_number** | [**character**](.md)| Leg increment number when a sampling operation took place.  Each vessel participating in the survey partakes in multiple legs (leg #1, #2...) as part of the survey schedule within a given pass, with each survey containing multiple passes per year.  A vessel on the WCGBTS Shelf/Slope Survey typically is scheduled for 5 legs per year, although this is subject to change due to year-to-year schedule differences. | [optional] 
 **life_stage_name** | [**character**](.md)| Life stage or ontogeny designation of the catch sample (i.e. egg case, larval, adult, YoY).  If not specified (it typically is not called out by scientists in the field) the catch can be assumed to be fully mature adults. | [optional] 
 **net_off_bottom_at** | [**character**](.md)| Date and time when the footrope loses contact with the bottom after haulback has begun, marking the end of \&quot;sampling\&quot; / \&quot;fishing\&quot; for the tow. UTC Date and time with timezone offset following in ISO 8601 (&#x60;YYYY-MM-DD HH:MM:SS+00&#x60;). Timestamp is to seconds precision (no fractional seconds). | [optional] 
 **net_on_bottom_at** | [**character**](.md)| Date and time when the footrope initially makes contact with the bottom, marking the start of \&quot;sampling\&quot; / \&quot;fishing\&quot; for the tow. UTC Date and time with timezone offset following in ISO 8601 (&#x60;YYYY-MM-DD HH:MM:SS+00&#x60;). Timestamp is to seconds precision (no fractional seconds). | [optional] 
 **nmfs_project_name** | [**character**](.md)| Name of the project/survey under the National Marine Fisheries Service (NMFS) for which the data was collected. | [optional] 
 **pass_number** | [**character**](.md)| Pass increment number when a sampling operation took place (i.e. pass #1, #2...).  Each annual survey typically has multiple passes, with each pass being assigned one or several vessels to participate in sampling. | [optional] 
 **sampled_catch_individuals_count** | [**character**](.md)| Tally of individual organisms that were physically counted in the catch sample. | [optional] 
 **sampled_catch_weight_kg** | [**character**](.md)| Sample weight of the catch in kilograms that was physically measured. | [optional] 
 **sampling_date** | [**character**](.md)| Date when sampling took place, in YYYY-MM-DD ISO8601 format | [optional] 
 **source_wcgbts_id** | [**character**](.md)| Source catch UUID (v7) identifier for the record sources from the field WCGBTS database. | [optional] 
 **survey_year** | [**character**](.md)| Calendar year in integer format YYYY during which data was collected. | [optional] 
 **total_catch_individuals_count** | [**character**](.md)| Total estimated tally of individual organisms from the catch sample.  Unless all individuals are counted, the total tally of individuals in the catch sample is extrapolated using the average weight per individual from the physically weighed/tallied sample.  For example, if 100kg of canary rockfish is weighed, but only 8 individuals weighing 16kg were tallied, we&#39;d assume a total tally in the sample of 50 indiviauls (100kg / 2kg per fish).  Fractional individuals are rounded up (i.e. estimated tally &#x3D; 12.3 &#x3D;&#x3D;&gt; 13 fish). | [optional] 
 **total_catch_weight_kg** | [**character**](.md)| Total weight of the catch sample in kilograms.  This value often matches the physically weighed weight, but may diverge if the scientist decides to subsample the whole due to logistical or time constraints.  In this scenario the total catch weight is extrapolated using the proportion of the species from the subsample with respect to other species in that same total sample. | [optional] 
 **tow_performance_name** | [**character**](.md)| Tows should be marked as \&quot;satisfactory\&quot; or \&quot;unsatisfactory\&quot;, with satisfactory tows typically considered viable for stock assessment. | [optional] 
 **vessel_name** | [**character**](.md)| Full name of the commercial or research vessel used to collect the data at sea. | [optional] 
 **was_actual_station_active_when_sampled** | [**character**](.md)| Boolean indicating if the actual station was active at the time it was sampled. The \&quot;best\&quot; sampling site designation indicates that the single summarized tow/haul location falls within this site boundary. The \&quot;target\&quot; site may diverge from the \&quot;best\&quot; in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to this preferred geolocated site. | [optional] 
 **was_target_station_active_when_sampled** | [**character**](.md)| Boolean indicating if the target station was active at the time of sampling. The \&quot;target\&quot; sampling site designation indicates that the site was the target for sampling for the particular operation. The \&quot;target\&quot; site may diverge from the \&quot;best\&quot; in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to the \&quot;best\&quot; preferred geolocated site. | [optional] 

### Return type

[**array[BottomTrawlCatch]**](bottom_trawl_catch.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/csv, application/zip, application/vnd.apache.parquet

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Success |  -  |
| **302** | Redirect to S3 for large sets or alternative formats |  * Location - The pre-signed S3 URL <br>  |

# **GetBottomTrawlSamplingStations**
> array[BottomTrawlSamplingStations] GetBottomTrawlSamplingStations(limit = var.limit, fields = var.fields, offset = var.offset, redirect = var.redirect, data_format = var.data_format, response_mode = var.response_mode, include_noncore_fields = var.include_noncore_fields, is_station_active = var.is_station_active, overlapping_state_waters_name = var.overlapping_state_waters_name, sampling_station_code = var.sampling_station_code, source_wcgbts_id = var.source_wcgbts_id, station_area_ha = var.station_area_ha, station_centroid_key = var.station_centroid_key, station_centroid_latitude_dd = var.station_centroid_latitude_dd, station_centroid_longitude_dd = var.station_centroid_longitude_dd, station_current_deactivation_reasons = var.station_current_deactivation_reasons, station_depth_stratum_name = var.station_depth_stratum_name, station_design_suite_name = var.station_design_suite_name, station_design_type_name = var.station_design_type_name, station_incorporated_at = var.station_incorporated_at, station_last_deactivation_year = var.station_last_deactivation_year, station_latitude_stratum_name = var.station_latitude_stratum_name, station_lower_left_latitude_dd = var.station_lower_left_latitude_dd, station_lower_left_longitude_dd = var.station_lower_left_longitude_dd, station_lower_right_latitude_dd = var.station_lower_right_latitude_dd, station_lower_right_longitude_dd = var.station_lower_right_longitude_dd, station_max_depth_m = var.station_max_depth_m, station_min_depth_m = var.station_min_depth_m, station_upper_left_latitude_dd = var.station_upper_left_latitude_dd, station_upper_left_longitude_dd = var.station_upper_left_longitude_dd, station_upper_right_latitude_dd = var.station_upper_right_latitude_dd, station_upper_right_longitude_dd = var.station_upper_right_longitude_dd, was_station_ever_inactive = var.was_station_ever_inactive)

West Coast Bottom Trawl Station Grid

Report storing one record per station grid sampling cell used in the random stratified survey design for the West Coast Groundfish Bottom Trawl Shelf/Slope Survey.     Stations span the entire West Coast from Northern Washington to Southern California, reaching out to cover the entire shelf up to ~700 fathoms. The majority of stations are rectangular with four vertices and have an approximate area of 1,028 hectares. Each station is assigned a unique station code and a centroid key (see individual column definitions for details).    For randomized annual selection, stations are stratified into the following groups:    **Depth Strata:**  * 30 – 100 fathoms  * 100 – 300 fathoms  * 300 – 700 fathoms    **Latitude Strata:**  * North of Point Conception  * South of Point Conception    > **Note on Station Activation:** Stations may be deactivated and excluded from the survey over time due to changes in viable or allowed sampling areas. They may also be reactivated if these environmental or regulatory conditions change.

### Example
```R
library(nwfscDataCatalog)

# West Coast Bottom Trawl Station Grid
#
# prepare function argument(s)
var_limit <- 56 # integer | Max rows to return (Optional)
var_fields <- c("inner_example") # array[character] | Comma-separated column filter (Optional)
var_offset <- 56 # integer | Rows to skip before beginning to return records. (Optional)
var_redirect <- "redirect_example" # character | Force S3 pre-signed redirect (Optional)
var_data_format <- "data_format_example" # character | Response format: json, csv, or parquet (Optional)
var_response_mode <- "response_mode_example" # character | Delivery mode: data, package (Optional)
var_include_noncore_fields <- "include_noncore_fields_example" # character | All fields returned when true, else only core fields returned. (Optional)
var_is_station_active <- "is_station_active_example" # character | Boolean flag indicating whether the station is currently active and eligible for selection in the survey design. (Optional)
var_overlapping_state_waters_name <- "overlapping_state_waters_name_example" # character | The name of the state (WA, OR, CA) whose territorial waters overlap with the station boundary, if applicable. (Optional)
var_sampling_station_code <- "sampling_station_code_example" # character | The unique alphanumeric code identifying the sampling station (e.g., cell or grid ID). (Optional)
var_source_wcgbts_id <- "source_wcgbts_id_example" # character | The primary key identifier from the upstream source application database, retained for auditing and exact record matching. (Optional)
var_station_area_ha <- "station_area_ha_example" # character | The total geographic area of the station boundary, in hectares. (Optional)
var_station_centroid_key <- "station_centroid_key_example" # character | A composite spatial key that uniquely identifies the centroid of a WCGBTS (West Coast Groundfish Bottom Trawl Survey) sampling station grid cell.     This key is a fixed 8-character string constructed by converting decimal degree coordinates into Degrees and Decimal Minutes (DDM), stripping away negative signs and truncating specific digits to create a consistent spatial identifier.    ### Component Breakdown  The 8-character format strictly follows the pattern **`[Lat Degrees][Lat Minutes][Lon Degrees][Lon Minutes]`**:    * **Latitude Degrees (2 characters):** The whole number of the decimal latitude (e.g., `43.58` becomes `43`).  * **Latitude Minutes (2 characters):** The decimal remainder of the latitude multiplied by 60 and rounded to the nearest whole number (e.g., `0.58139 * 60 = 34.88`, which rounds to `35`).  * **Longitude Degrees (2 characters):** The whole number of the longitude, ignoring the negative sign (West) and dropping the leading hundreds place (e.g., `-124.61` becomes `24`).  * **Longitude Minutes (2 characters):** The decimal remainder of the longitude multiplied by 60 and rounded to the nearest whole number (e.g., `0.61465 * 60 = 36.87`, which rounds to `37`).    > **Example:** A grid cell centroid located at decimal coordinates **`43.58139678, -124.61465068`** results in the centroid key **`43352437`**. (Optional)
var_station_centroid_latitude_dd <- "station_centroid_latitude_dd_example" # character | The sampling sites centroid location latitude. Latitude presented as decimal degrees with up to eight points of precision. Latitude presented as decimal degrees with up to eight points of precision. (Optional)
var_station_centroid_longitude_dd <- "station_centroid_longitude_dd_example" # character | The sampling sites centroid location longitude. Longitude presented as decimal degrees with up to eight points of precision. Longitude presented as decimal degrees with up to eight points of precision. (Optional)
var_station_current_deactivation_reasons <- "station_current_deactivation_reasons_example" # character | If the station is currently inactive, the reason(s) why it was removed from the selection pool (e.g., untrawlable, hard bottom, shipping lane). (Optional)
var_station_depth_stratum_name <- "station_depth_stratum_name_example" # character | The depth stratification band the station falls within (e.g., 'Shelf', 'Upper Slope'). (Optional)
var_station_design_suite_name <- "station_design_suite_name_example" # character | The specific historical or current survey design frame this station belongs to (e.g., 'NWFSC Grids 2003'). (Optional)
var_station_design_type_name <- "station_design_type_name_example" # character | The geometric or survey design type of the station (e.g., 'Cell', 'Polygon'). (Optional)
var_station_incorporated_at <- "station_incorporated_at_example" # character | Date and time when site was first recognized as a sampling area for data collection. (Optional)
var_station_last_deactivation_year <- "station_last_deactivation_year_example" # character | The most recent calendar year when the station was deactivated/disabled. (Optional)
var_station_latitude_stratum_name <- "station_latitude_stratum_name_example" # character | The latitudinal stratification band the station falls within, used for survey weighting and selection. (Optional)
var_station_lower_left_latitude_dd <- "station_lower_left_latitude_dd_example" # character | Latitude of a sampling station's lower left vertex/corner. Latitude presented as decimal degrees with up to eight points of precision. (Optional)
var_station_lower_left_longitude_dd <- "station_lower_left_longitude_dd_example" # character | Longitude of a sampling station's lower left vertex/corner. Longitude presented as decimal degrees with up to eight points of precision. (Optional)
var_station_lower_right_latitude_dd <- "station_lower_right_latitude_dd_example" # character | Latitude of a sampling station's lower right vertex/corner. Latitude presented as decimal degrees with up to eight points of precision. (Optional)
var_station_lower_right_longitude_dd <- "station_lower_right_longitude_dd_example" # character | Longitude of a sampling station's lower right vertex/corner. Longitude presented as decimal degrees with up to eight points of precision. (Optional)
var_station_max_depth_m <- "station_max_depth_m_example" # character | The maximum recorded or charted depth of the station, in meters. (Optional)
var_station_min_depth_m <- "station_min_depth_m_example" # character | The minimum recorded or charted depth of the station, in meters. (Optional)
var_station_upper_left_latitude_dd <- "station_upper_left_latitude_dd_example" # character | Latitude of a sampling station's upper left vertex/corner. Latitude presented as decimal degrees with up to eight points of precision. (Optional)
var_station_upper_left_longitude_dd <- "station_upper_left_longitude_dd_example" # character | Longitude of a sampling station's upper left vertex/corner. Longitude presented as decimal degrees with up to eight points of precision. (Optional)
var_station_upper_right_latitude_dd <- "station_upper_right_latitude_dd_example" # character | Latitude of a sampling station's upper right vertex/corner. Latitude presented as decimal degrees with up to eight points of precision. (Optional)
var_station_upper_right_longitude_dd <- "station_upper_right_longitude_dd_example" # character | Longitude of a sampling station's upper right vertex/corner. Longitude presented as decimal degrees with up to eight points of precision. (Optional)
var_was_station_ever_inactive <- "was_station_ever_inactive_example" # character | Boolean indicating if site was inactive for any year/period of time after it was first created. (Optional)

api_instance <- DefaultApi$new()
# to save the result into a file, simply add the optional `data_file` parameter, e.g.
# result <- api_instance$GetBottomTrawlSamplingStations(limit = var_limit, fields = var_fields, offset = var_offset, redirect = var_redirect, data_format = var_data_format, response_mode = var_response_mode, include_noncore_fields = var_include_noncore_fields, is_station_active = var_is_station_active, overlapping_state_waters_name = var_overlapping_state_waters_name, sampling_station_code = var_sampling_station_code, source_wcgbts_id = var_source_wcgbts_id, station_area_ha = var_station_area_ha, station_centroid_key = var_station_centroid_key, station_centroid_latitude_dd = var_station_centroid_latitude_dd, station_centroid_longitude_dd = var_station_centroid_longitude_dd, station_current_deactivation_reasons = var_station_current_deactivation_reasons, station_depth_stratum_name = var_station_depth_stratum_name, station_design_suite_name = var_station_design_suite_name, station_design_type_name = var_station_design_type_name, station_incorporated_at = var_station_incorporated_at, station_last_deactivation_year = var_station_last_deactivation_year, station_latitude_stratum_name = var_station_latitude_stratum_name, station_lower_left_latitude_dd = var_station_lower_left_latitude_dd, station_lower_left_longitude_dd = var_station_lower_left_longitude_dd, station_lower_right_latitude_dd = var_station_lower_right_latitude_dd, station_lower_right_longitude_dd = var_station_lower_right_longitude_dd, station_max_depth_m = var_station_max_depth_m, station_min_depth_m = var_station_min_depth_m, station_upper_left_latitude_dd = var_station_upper_left_latitude_dd, station_upper_left_longitude_dd = var_station_upper_left_longitude_dd, station_upper_right_latitude_dd = var_station_upper_right_latitude_dd, station_upper_right_longitude_dd = var_station_upper_right_longitude_dd, was_station_ever_inactive = var_was_station_ever_inactivedata_file = "result.txt")
result <- api_instance$GetBottomTrawlSamplingStations(limit = var_limit, fields = var_fields, offset = var_offset, redirect = var_redirect, data_format = var_data_format, response_mode = var_response_mode, include_noncore_fields = var_include_noncore_fields, is_station_active = var_is_station_active, overlapping_state_waters_name = var_overlapping_state_waters_name, sampling_station_code = var_sampling_station_code, source_wcgbts_id = var_source_wcgbts_id, station_area_ha = var_station_area_ha, station_centroid_key = var_station_centroid_key, station_centroid_latitude_dd = var_station_centroid_latitude_dd, station_centroid_longitude_dd = var_station_centroid_longitude_dd, station_current_deactivation_reasons = var_station_current_deactivation_reasons, station_depth_stratum_name = var_station_depth_stratum_name, station_design_suite_name = var_station_design_suite_name, station_design_type_name = var_station_design_type_name, station_incorporated_at = var_station_incorporated_at, station_last_deactivation_year = var_station_last_deactivation_year, station_latitude_stratum_name = var_station_latitude_stratum_name, station_lower_left_latitude_dd = var_station_lower_left_latitude_dd, station_lower_left_longitude_dd = var_station_lower_left_longitude_dd, station_lower_right_latitude_dd = var_station_lower_right_latitude_dd, station_lower_right_longitude_dd = var_station_lower_right_longitude_dd, station_max_depth_m = var_station_max_depth_m, station_min_depth_m = var_station_min_depth_m, station_upper_left_latitude_dd = var_station_upper_left_latitude_dd, station_upper_left_longitude_dd = var_station_upper_left_longitude_dd, station_upper_right_latitude_dd = var_station_upper_right_latitude_dd, station_upper_right_longitude_dd = var_station_upper_right_longitude_dd, was_station_ever_inactive = var_was_station_ever_inactive)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **integer**| Max rows to return | [optional] 
 **fields** | list( **character** )| Comma-separated column filter | [optional] 
 **offset** | **integer**| Rows to skip before beginning to return records. | [optional] 
 **redirect** | **character**| Force S3 pre-signed redirect | [optional] 
 **data_format** | **character**| Response format: json, csv, or parquet | [optional] 
 **response_mode** | **character**| Delivery mode: data, package | [optional] 
 **include_noncore_fields** | **character**| All fields returned when true, else only core fields returned. | [optional] 
 **is_station_active** | [**character**](.md)| Boolean flag indicating whether the station is currently active and eligible for selection in the survey design. | [optional] 
 **overlapping_state_waters_name** | [**character**](.md)| The name of the state (WA, OR, CA) whose territorial waters overlap with the station boundary, if applicable. | [optional] 
 **sampling_station_code** | [**character**](.md)| The unique alphanumeric code identifying the sampling station (e.g., cell or grid ID). | [optional] 
 **source_wcgbts_id** | [**character**](.md)| The primary key identifier from the upstream source application database, retained for auditing and exact record matching. | [optional] 
 **station_area_ha** | [**character**](.md)| The total geographic area of the station boundary, in hectares. | [optional] 
 **station_centroid_key** | [**character**](.md)| A composite spatial key that uniquely identifies the centroid of a WCGBTS (West Coast Groundfish Bottom Trawl Survey) sampling station grid cell.     This key is a fixed 8-character string constructed by converting decimal degree coordinates into Degrees and Decimal Minutes (DDM), stripping away negative signs and truncating specific digits to create a consistent spatial identifier.    ### Component Breakdown  The 8-character format strictly follows the pattern **&#x60;[Lat Degrees][Lat Minutes][Lon Degrees][Lon Minutes]&#x60;**:    * **Latitude Degrees (2 characters):** The whole number of the decimal latitude (e.g., &#x60;43.58&#x60; becomes &#x60;43&#x60;).  * **Latitude Minutes (2 characters):** The decimal remainder of the latitude multiplied by 60 and rounded to the nearest whole number (e.g., &#x60;0.58139 * 60 &#x3D; 34.88&#x60;, which rounds to &#x60;35&#x60;).  * **Longitude Degrees (2 characters):** The whole number of the longitude, ignoring the negative sign (West) and dropping the leading hundreds place (e.g., &#x60;-124.61&#x60; becomes &#x60;24&#x60;).  * **Longitude Minutes (2 characters):** The decimal remainder of the longitude multiplied by 60 and rounded to the nearest whole number (e.g., &#x60;0.61465 * 60 &#x3D; 36.87&#x60;, which rounds to &#x60;37&#x60;).    &gt; **Example:** A grid cell centroid located at decimal coordinates **&#x60;43.58139678, -124.61465068&#x60;** results in the centroid key **&#x60;43352437&#x60;**. | [optional] 
 **station_centroid_latitude_dd** | [**character**](.md)| The sampling sites centroid location latitude. Latitude presented as decimal degrees with up to eight points of precision. Latitude presented as decimal degrees with up to eight points of precision. | [optional] 
 **station_centroid_longitude_dd** | [**character**](.md)| The sampling sites centroid location longitude. Longitude presented as decimal degrees with up to eight points of precision. Longitude presented as decimal degrees with up to eight points of precision. | [optional] 
 **station_current_deactivation_reasons** | [**character**](.md)| If the station is currently inactive, the reason(s) why it was removed from the selection pool (e.g., untrawlable, hard bottom, shipping lane). | [optional] 
 **station_depth_stratum_name** | [**character**](.md)| The depth stratification band the station falls within (e.g., &#39;Shelf&#39;, &#39;Upper Slope&#39;). | [optional] 
 **station_design_suite_name** | [**character**](.md)| The specific historical or current survey design frame this station belongs to (e.g., &#39;NWFSC Grids 2003&#39;). | [optional] 
 **station_design_type_name** | [**character**](.md)| The geometric or survey design type of the station (e.g., &#39;Cell&#39;, &#39;Polygon&#39;). | [optional] 
 **station_incorporated_at** | [**character**](.md)| Date and time when site was first recognized as a sampling area for data collection. | [optional] 
 **station_last_deactivation_year** | [**character**](.md)| The most recent calendar year when the station was deactivated/disabled. | [optional] 
 **station_latitude_stratum_name** | [**character**](.md)| The latitudinal stratification band the station falls within, used for survey weighting and selection. | [optional] 
 **station_lower_left_latitude_dd** | [**character**](.md)| Latitude of a sampling station&#39;s lower left vertex/corner. Latitude presented as decimal degrees with up to eight points of precision. | [optional] 
 **station_lower_left_longitude_dd** | [**character**](.md)| Longitude of a sampling station&#39;s lower left vertex/corner. Longitude presented as decimal degrees with up to eight points of precision. | [optional] 
 **station_lower_right_latitude_dd** | [**character**](.md)| Latitude of a sampling station&#39;s lower right vertex/corner. Latitude presented as decimal degrees with up to eight points of precision. | [optional] 
 **station_lower_right_longitude_dd** | [**character**](.md)| Longitude of a sampling station&#39;s lower right vertex/corner. Longitude presented as decimal degrees with up to eight points of precision. | [optional] 
 **station_max_depth_m** | [**character**](.md)| The maximum recorded or charted depth of the station, in meters. | [optional] 
 **station_min_depth_m** | [**character**](.md)| The minimum recorded or charted depth of the station, in meters. | [optional] 
 **station_upper_left_latitude_dd** | [**character**](.md)| Latitude of a sampling station&#39;s upper left vertex/corner. Latitude presented as decimal degrees with up to eight points of precision. | [optional] 
 **station_upper_left_longitude_dd** | [**character**](.md)| Longitude of a sampling station&#39;s upper left vertex/corner. Longitude presented as decimal degrees with up to eight points of precision. | [optional] 
 **station_upper_right_latitude_dd** | [**character**](.md)| Latitude of a sampling station&#39;s upper right vertex/corner. Latitude presented as decimal degrees with up to eight points of precision. | [optional] 
 **station_upper_right_longitude_dd** | [**character**](.md)| Longitude of a sampling station&#39;s upper right vertex/corner. Longitude presented as decimal degrees with up to eight points of precision. | [optional] 
 **was_station_ever_inactive** | [**character**](.md)| Boolean indicating if site was inactive for any year/period of time after it was first created. | [optional] 

### Return type

[**array[BottomTrawlSamplingStations]**](bottom_trawl_sampling_stations.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/csv, application/zip, application/vnd.apache.parquet

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Success |  -  |
| **302** | Redirect to S3 for large sets or alternative formats |  * Location - The pre-signed S3 URL <br>  |

# **GetBottomTrawlSpecimens**
> array[BottomTrawlSpecimens] GetBottomTrawlSpecimens(limit = var.limit, fields = var.fields, offset = var.offset, redirect = var.redirect, data_format = var.data_format, response_mode = var.response_mode, include_noncore_fields = var.include_noncore_fields, actual_station_centroid_key = var.actual_station_centroid_key, actual_station_code = var.actual_station_code, actual_station_current_deactivation_reasons = var.actual_station_current_deactivation_reasons, actual_station_deactivation_year = var.actual_station_deactivation_year, actual_station_depth_stratum_name = var.actual_station_depth_stratum_name, actual_station_latitude_stratum_name = var.actual_station_latitude_stratum_name, ageing_lab_name = var.ageing_lab_name, age_last_analyzed_at = var.age_last_analyzed_at, age_sample_type_name = var.age_sample_type_name, best_available_taxon_category = var.best_available_taxon_category, best_available_taxon_common_name = var.best_available_taxon_common_name, best_available_taxon_is_coral = var.best_available_taxon_is_coral, best_available_taxon_is_invertebrate = var.best_available_taxon_is_invertebrate, best_available_taxon_is_pacific_salmon = var.best_available_taxon_is_pacific_salmon, best_available_taxon_is_rockfish = var.best_available_taxon_is_rockfish, best_available_taxon_is_sponge = var.best_available_taxon_is_sponge, best_available_taxon_itis_tsn = var.best_available_taxon_itis_tsn, best_available_taxon_scientific_name = var.best_available_taxon_scientific_name, best_available_taxon_subcategory = var.best_available_taxon_subcategory, best_available_taxon_worms_aphia_id = var.best_available_taxon_worms_aphia_id, best_tow_latitude_dd = var.best_tow_latitude_dd, best_tow_longitude_dd = var.best_tow_longitude_dd, bottom_trawl_operation_key = var.bottom_trawl_operation_key, data_readiness_level_code = var.data_readiness_level_code, data_readiness_level_display_name = var.data_readiness_level_display_name, data_status_name = var.data_status_name, is_actual_station_currently_active = var.is_actual_station_currently_active, lab_analyzed_maturity_stage_name = var.lab_analyzed_maturity_stage_name, leg_number = var.leg_number, net_off_bottom_at = var.net_off_bottom_at, net_on_bottom_at = var.net_on_bottom_at, nmfs_project_name = var.nmfs_project_name, ovary_last_analyzed_at = var.ovary_last_analyzed_at, ovary_proportion_atresia = var.ovary_proportion_atresia, pass_number = var.pass_number, sampling_date = var.sampling_date, source_wcgbts_id = var.source_wcgbts_id, specimen_age_sample_label = var.specimen_age_sample_label, specimen_age_years = var.specimen_age_years, specimen_finclip_sample_label = var.specimen_finclip_sample_label, specimen_life_stage_name = var.specimen_life_stage_name, specimen_ovary_sample_label = var.specimen_ovary_sample_label, specimen_sex_code = var.specimen_sex_code, specimen_size_cm = var.specimen_size_cm, specimen_size_sample_type_name = var.specimen_size_sample_type_name, specimen_stomach_sample_label = var.specimen_stomach_sample_label, specimen_tissue_sample_label = var.specimen_tissue_sample_label, specimen_weight_kg = var.specimen_weight_kg, survey_year = var.survey_year, tow_performance_name = var.tow_performance_name, vessel_name = var.vessel_name, was_actual_station_active_when_sampled = var.was_actual_station_active_when_sampled, was_target_station_active_when_sampled = var.was_target_station_active_when_sampled)

West Coast Bottom Trawl Specimens

A report of individual organisms that were biologically sampled for the West Coast Groundfish Bottom Trawl surveys.  Each row represents an individual organism, and is stored alongside the best or most recent associated biological samples taken from the individual.

### Example
```R
library(nwfscDataCatalog)

# West Coast Bottom Trawl Specimens
#
# prepare function argument(s)
var_limit <- 56 # integer | Max rows to return (Optional)
var_fields <- c("inner_example") # array[character] | Comma-separated column filter (Optional)
var_offset <- 56 # integer | Rows to skip before beginning to return records. (Optional)
var_redirect <- "redirect_example" # character | Force S3 pre-signed redirect (Optional)
var_data_format <- "data_format_example" # character | Response format: json, csv, or parquet (Optional)
var_response_mode <- "response_mode_example" # character | Delivery mode: data, package (Optional)
var_include_noncore_fields <- "include_noncore_fields_example" # character | All fields returned when true, else only core fields returned. (Optional)
var_actual_station_centroid_key <- "actual_station_centroid_key_example" # character | A composite spatial key that uniquely identifies the centroid of a WCGBTS (West Coast Groundfish Bottom Trawl Survey) sampling station grid cell.     This key is a fixed 8-character string constructed by converting decimal degree coordinates into Degrees and Decimal Minutes (DDM), stripping away negative signs and truncating specific digits to create a consistent spatial identifier.    ### Component Breakdown  The 8-character format strictly follows the pattern **`[Lat Degrees][Lat Minutes][Lon Degrees][Lon Minutes]`**:    * **Latitude Degrees (2 characters):** The whole number of the decimal latitude (e.g., `43.58` becomes `43`).  * **Latitude Minutes (2 characters):** The decimal remainder of the latitude multiplied by 60 and rounded to the nearest whole number (e.g., `0.58139 * 60 = 34.88`, which rounds to `35`).  * **Longitude Degrees (2 characters):** The whole number of the longitude, ignoring the negative sign (West) and dropping the leading hundreds place (e.g., `-124.61` becomes `24`).  * **Longitude Minutes (2 characters):** The decimal remainder of the longitude multiplied by 60 and rounded to the nearest whole number (e.g., `0.61465 * 60 = 36.87`, which rounds to `37`).    > **Example:** A grid cell centroid located at decimal coordinates **`43.58139678, -124.61465068`** results in the centroid key **`43352437`**. (Optional)
var_actual_station_code <- "actual_station_code_example" # character | Unique identifier for the sampling site visited. For the West Coast Groundfish Bottom Trawl Shelf/Slope Survey, sites follow a gridded pattern. Site codes incrementing sequentially by one from North to South and West to East, with the site furthest to the North starting at 4039 and the site furthest to the south ending at 23399. Most site codes are integers, but present as text data types to accommodate historical formats which included alphanumeric values. Historical site splits are represented by floating point numbers (site 44444 split to 44444.1 and 44444.2). The \"best\" sampling site designation indicates that the single summarized tow/haul location falls within this site boundary. The \"target\" site may diverge from the \"best\" in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to this preferred geolocated site. (Optional)
var_actual_station_current_deactivation_reasons <- "actual_station_current_deactivation_reasons_example" # character | Comma-separated list of current reasons that a station is listed as inactive.  Value should be null unless the station is currently inactive. (Optional)
var_actual_station_deactivation_year <- "actual_station_deactivation_year_example" # character | The year YYYY when the actual station sampled was last deactivated, if the site is currently inactive. The \"best\" sampling site designation indicates that the single summarized tow/haul location falls within this site boundary. The \"target\" site may diverge from the \"best\" in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to this preferred geolocated site. (Optional)
var_actual_station_depth_stratum_name <- "actual_station_depth_stratum_name_example" # character | Name of the depth stratum that the sampling site falls into. Sampling on the West Coast Groundfish Bottom Trawl Shelf/Slope Survey follows a randomly stratified design, with sampling sites falling into one of three depth strata: 30-100 fathoms, 100-300 fathoms, and 300-700 fathoms. The \"best\" sampling site designation indicates that the single summarized tow/haul location falls within this site boundary. The \"target\" site may diverge from the \"best\" in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to this preferred geolocated site. (Optional)
var_actual_station_latitude_stratum_name <- "actual_station_latitude_stratum_name_example" # character | Name of the latitude stratum that the sampling site falls into. Sampling on the West Coast Groundfish Bottom Trawl Shelf/Slope Survey follows a randomly stratified design, with sampling sites falling into one of two latitude strata: North of Point Conception (>34°30'N) or South of Point Conception (<34°30'N). The \"best\" sampling site designation indicates that the single summarized tow/haul location falls within this site boundary. The \"target\" site may diverge from the \"best\" in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to this preferred geolocated site. (Optional)
var_ageing_lab_name <- "ageing_lab_name_example" # character | Name of the ageing lab where this specimen's age structure was analyzed and aged. (Optional)
var_age_last_analyzed_at <- "age_last_analyzed_at_example" # character | Date the last time this specimen age structure was aged by the ageing lab (Optional)
var_age_sample_type_name <- "age_sample_type_name_example" # character | Type of age sample (Optional)
var_best_available_taxon_category <- "best_available_taxon_category_example" # character | Broad scientific category of the taxon (e.g., Fish, Invertebrate, Mammal, Marine Plant). \"Best available\" designation reflects the taxonomic classification of the species after postseason review, which may be the same or different than the taxonomic classification determined in the field at time of collection. (Optional)
var_best_available_taxon_common_name <- "best_available_taxon_common_name_example" # character | Common name of the species preferred by the Northwest Fisheries Science Center. \"Best available\" designation reflects the taxonomic classification of the species after postseason review, which may be the same or different than the taxonomic classification determined in the field at time of collection. (Optional)
var_best_available_taxon_is_coral <- "best_available_taxon_is_coral_example" # character | Boolean flag indicating if the taxon belongs to the subclass Octocorallia (corals). \"Best available\" designation reflects the taxonomic classification of the species after postseason review, which may be the same or different than the taxonomic classification determined in the field at time of collection. (Optional)
var_best_available_taxon_is_invertebrate <- "best_available_taxon_is_invertebrate_example" # character | Boolean flag indicating if the taxon is an invertebrate (Kingdom Animalia, excluding Subphylum Vertebrata). \"Best available\" designation reflects the taxonomic classification of the species after postseason review, which may be the same or different than the taxonomic classification determined in the field at time of collection. (Optional)
var_best_available_taxon_is_pacific_salmon <- "best_available_taxon_is_pacific_salmon_example" # character | Boolean flag indicating if the taxon belongs to the genus Oncorhynchus (Pacific salmon). \"Best available\" designation reflects the taxonomic classification of the species after postseason review, which may be the same or different than the taxonomic classification determined in the field at time of collection. (Optional)
var_best_available_taxon_is_rockfish <- "best_available_taxon_is_rockfish_example" # character | Boolean flag indicating if the taxon belongs to the genus Sebastes (rockfishes). \"Best available\" designation reflects the taxonomic classification of the species after postseason review, which may be the same or different than the taxonomic classification determined in the field at time of collection. (Optional)
var_best_available_taxon_is_sponge <- "best_available_taxon_is_sponge_example" # character | Boolean flag indicating if the taxon belongs to the phylum Porifera (sponges). \"Best available\" designation reflects the taxonomic classification of the species after postseason review, which may be the same or different than the taxonomic classification determined in the field at time of collection. (Optional)
var_best_available_taxon_itis_tsn <- "best_available_taxon_itis_tsn_example" # character | Taxonomic Serial Number (TSN) is a unique, stable, and persistent numeric identifier assigned by the Integrated Taxonomic Information System (ITIS) to scientific names of organisms. It serves as a non-intelligent, permanent key for tracking species, synonyms, and taxonomic changes across various databases, ensuring standardized classification of flora and fauna. \"Best available\" designation reflects the taxonomic classification of the species after postseason review, which may be the same or different than the taxonomic classification determined in the field at time of collection. (Optional)
var_best_available_taxon_scientific_name <- "best_available_taxon_scientific_name_example" # character | Scientific name or latinized nomenclature of the species caught used to uniquely identify taxonomic classification. \"Best available\" designation reflects the taxonomic classification of the species after postseason review, which may be the same or different than the taxonomic classification determined in the field at time of collection. (Optional)
var_best_available_taxon_subcategory <- "best_available_taxon_subcategory_example" # character | More granular scientific subcategory of the taxon (e.g., Rockfish, Flatfish, Roundfish, Crab, Shrimp). \"Best available\" designation reflects the taxonomic classification of the species after postseason review, which may be the same or different than the taxonomic classification determined in the field at time of collection. (Optional)
var_best_available_taxon_worms_aphia_id <- "best_available_taxon_worms_aphia_id_example" # character | The AphiaID is a unique, stable, and persistent numerical identifier used within the World Register of Marine Species (WoRMS) database to identify, track, and manage marine organisms, including their taxonomic classification, synonyms, and related biological traits. It serves as the core taxonomic infrastructure, ensuring data consistency and enabling integration with external biological databases. \"Best available\" designation reflects the taxonomic classification of the species after postseason review, which may be the same or different than the taxonomic classification determined in the field at time of collection. (Optional)
var_best_tow_latitude_dd <- "best_tow_latitude_dd_example" # character | Summarized location of the tow representing the single point in space that best represents where the tow sampling took place. Typically this location is derived by combining the median latitude and longitude of the estimated gear track wihle the gear is fishing and in contact with the bottom. Latitude presented as decimal degrees with up to eight points of precision. Latitude presented as decimal degrees with up to eight points of precision. (Optional)
var_best_tow_longitude_dd <- "best_tow_longitude_dd_example" # character | Summarized location of the tow representing the single point in space that best represents where the tow sampling took place. Typically this location is derived by combining the median latitude and longitude of the estimated gear track wihle the gear is fishing and in contact with the bottom. Longitude presented as decimal degrees with up to eight points of precision. Longitude presented as decimal degrees with up to eight points of precision. (Optional)
var_bottom_trawl_operation_key <- "bottom_trawl_operation_key_example" # character | 12-character numeric unique identifier for a West Coast Groundfish Bottom Trawl sampling operation. Digits 1-4 represent the year (YYYY) of sampling, digits 5-6 represent the survey operation type, digits 7-9 represent the zero-padded vessel identifier, digits 10-12 represent the zero-padded sequential operation increment. (Optional)
var_data_readiness_level_code <- "data_readiness_level_code_example" # character | The code representing the data readiness level.     Values include:  * `L0`  * `L1`  * `L2`  * `L3`  * `L4` (Optional)
var_data_readiness_level_display_name <- "data_readiness_level_display_name_example" # character | The formatted display name combining the readiness level code and its status.     Values include:  * `L0 - RAW`  * `L1 - PRELIMINARY`  * `L2 - VERIFIED`  * `L3 - HARMONIZED`  * `L4 - DERIVED` (Optional)
var_data_status_name <- "data_status_name_example" # character | Name of the data point's current status with respect to its finalization/QC status.  Typically new data submitted directly from the field is flagged as \"Under Review\",   until it is reviewed, where it is then marked as \"Finalized\".  Unfinalized data may  be used for any purpose, but for fisheries stock assessment, using/filtering for  finalized data is best. (Optional)
var_is_actual_station_currently_active <- "is_actual_station_currently_active_example" # character | Boolean indicating if the actual station sampled is currently active. The \"best\" sampling site designation indicates that the single summarized tow/haul location falls within this site boundary. The \"target\" site may diverge from the \"best\" in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to this preferred geolocated site. (Optional)
var_lab_analyzed_maturity_stage_name <- "lab_analyzed_maturity_stage_name_example" # character | Maturity designation and certainty of the designation summary. (Optional)
var_leg_number <- "leg_number_example" # character | Leg increment number when a sampling operation took place.  Each vessel participating in the survey partakes in multiple legs (leg #1, #2...) as part of the survey schedule within a given pass, with each survey containing multiple passes per year.  A vessel on the WCGBTS Shelf/Slope Survey typically is scheduled for 5 legs per year, although this is subject to change due to year-to-year schedule differences. (Optional)
var_net_off_bottom_at <- "net_off_bottom_at_example" # character | Date and time when the footrope loses contact with the bottom after haulback has begun, marking the end of \"sampling\" / \"fishing\" for the tow. UTC Date and time with timezone offset following in ISO 8601 (`YYYY-MM-DD HH:MM:SS+00`). Timestamp is to seconds precision (no fractional seconds). (Optional)
var_net_on_bottom_at <- "net_on_bottom_at_example" # character | Date and time when the footrope initially makes contact with the bottom, marking the start of \"sampling\" / \"fishing\" for the tow. UTC Date and time with timezone offset following in ISO 8601 (`YYYY-MM-DD HH:MM:SS+00`). Timestamp is to seconds precision (no fractional seconds). (Optional)
var_nmfs_project_name <- "nmfs_project_name_example" # character | Name of the project/survey under the National Marine Fisheries Service (NMFS) for which the data was collected. (Optional)
var_ovary_last_analyzed_at <- "ovary_last_analyzed_at_example" # character | Date the last time this specimen ovary structure was aged by the maturities lab (Optional)
var_ovary_proportion_atresia <- "ovary_proportion_atresia_example" # character | The post-season measured proportion of oocytes (eggs) in the ovary sample that are undergoing atresia—the biological process of breaking down and reabsorbing unspawned eggs. A higher proportion typically indicates environmental stress, skipped spawning, or the end of a reproductive cycle as the fish recycles energy. (Optional)
var_pass_number <- "pass_number_example" # character | Pass increment number when a sampling operation took place (i.e. pass #1, #2...).  Each annual survey typically has multiple passes, with each pass being assigned one or several vessels to participate in sampling. (Optional)
var_sampling_date <- "sampling_date_example" # character | Date when sampling took place, in YYYY-MM-DD ISO8601 format (Optional)
var_source_wcgbts_id <- "source_wcgbts_id_example" # character | Source specimen identifier from WCGBTS database. UUID version 7 (UUIDv7) is a time-ordered, 128-bit universally unique identifier designed to improve database performance, combining a Unix timestamp (milliseconds precision) with random data. Defined in RFC 9562, it features 48 bits for the timestamp, 74 bits for randomness/entropy, and 6 bits for version/variant. It enables ordered, index-friendly primary keys. (Optional)
var_specimen_age_sample_label <- "specimen_age_sample_label_example" # character | Label for age sample (Optional)
var_specimen_age_years <- "specimen_age_years_example" # character | Age of the specimen determined by the ageling laboratory using the age structure collected from the specimen after capture. (Optional)
var_specimen_finclip_sample_label <- "specimen_finclip_sample_label_example" # character | Label for finclip sample (Optional)
var_specimen_life_stage_name <- "specimen_life_stage_name_example" # character | Life stage or ontogeny designation of the catch sample (i.e. egg case, larval, adult, YoY).  If not specified (it typically is not called out by scientists in the field) the catch can be assumed to be fully mature adults. (Optional)
var_specimen_ovary_sample_label <- "specimen_ovary_sample_label_example" # character | Label for ovary sample (Optional)
var_specimen_sex_code <- "specimen_sex_code_example" # character | Sex code (Optional)
var_specimen_size_cm <- "specimen_size_cm_example" # character | Length or width in cm (Optional)
var_specimen_size_sample_type_name <- "specimen_size_sample_type_name_example" # character | Type of length/width measurement taken sample (Optional)
var_specimen_stomach_sample_label <- "specimen_stomach_sample_label_example" # character | Label for stomach sample (Optional)
var_specimen_tissue_sample_label <- "specimen_tissue_sample_label_example" # character | Label for tissue sample (Optional)
var_specimen_weight_kg <- "specimen_weight_kg_example" # character | Recorded weight of the specimen in kilograms. (Optional)
var_survey_year <- "survey_year_example" # character | Calendar year in integer format YYYY during which data was collected. (Optional)
var_tow_performance_name <- "tow_performance_name_example" # character | Tows should be marked as \"satisfactory\" or \"unsatisfactory\", with satisfactory tows typically considered viable for stock assessment. (Optional)
var_vessel_name <- "vessel_name_example" # character | Full name of the commercial or research vessel used to collect the data at sea. (Optional)
var_was_actual_station_active_when_sampled <- "was_actual_station_active_when_sampled_example" # character | Boolean indicating if the actual station was active at the time it was sampled. The \"best\" sampling site designation indicates that the single summarized tow/haul location falls within this site boundary. The \"target\" site may diverge from the \"best\" in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to this preferred geolocated site. (Optional)
var_was_target_station_active_when_sampled <- "was_target_station_active_when_sampled_example" # character | Boolean indicating if the target station was active at the time of sampling. The \"target\" sampling site designation indicates that the site was the target for sampling for the particular operation. The \"target\" site may diverge from the \"best\" in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to the \"best\" preferred geolocated site. (Optional)

api_instance <- DefaultApi$new()
# to save the result into a file, simply add the optional `data_file` parameter, e.g.
# result <- api_instance$GetBottomTrawlSpecimens(limit = var_limit, fields = var_fields, offset = var_offset, redirect = var_redirect, data_format = var_data_format, response_mode = var_response_mode, include_noncore_fields = var_include_noncore_fields, actual_station_centroid_key = var_actual_station_centroid_key, actual_station_code = var_actual_station_code, actual_station_current_deactivation_reasons = var_actual_station_current_deactivation_reasons, actual_station_deactivation_year = var_actual_station_deactivation_year, actual_station_depth_stratum_name = var_actual_station_depth_stratum_name, actual_station_latitude_stratum_name = var_actual_station_latitude_stratum_name, ageing_lab_name = var_ageing_lab_name, age_last_analyzed_at = var_age_last_analyzed_at, age_sample_type_name = var_age_sample_type_name, best_available_taxon_category = var_best_available_taxon_category, best_available_taxon_common_name = var_best_available_taxon_common_name, best_available_taxon_is_coral = var_best_available_taxon_is_coral, best_available_taxon_is_invertebrate = var_best_available_taxon_is_invertebrate, best_available_taxon_is_pacific_salmon = var_best_available_taxon_is_pacific_salmon, best_available_taxon_is_rockfish = var_best_available_taxon_is_rockfish, best_available_taxon_is_sponge = var_best_available_taxon_is_sponge, best_available_taxon_itis_tsn = var_best_available_taxon_itis_tsn, best_available_taxon_scientific_name = var_best_available_taxon_scientific_name, best_available_taxon_subcategory = var_best_available_taxon_subcategory, best_available_taxon_worms_aphia_id = var_best_available_taxon_worms_aphia_id, best_tow_latitude_dd = var_best_tow_latitude_dd, best_tow_longitude_dd = var_best_tow_longitude_dd, bottom_trawl_operation_key = var_bottom_trawl_operation_key, data_readiness_level_code = var_data_readiness_level_code, data_readiness_level_display_name = var_data_readiness_level_display_name, data_status_name = var_data_status_name, is_actual_station_currently_active = var_is_actual_station_currently_active, lab_analyzed_maturity_stage_name = var_lab_analyzed_maturity_stage_name, leg_number = var_leg_number, net_off_bottom_at = var_net_off_bottom_at, net_on_bottom_at = var_net_on_bottom_at, nmfs_project_name = var_nmfs_project_name, ovary_last_analyzed_at = var_ovary_last_analyzed_at, ovary_proportion_atresia = var_ovary_proportion_atresia, pass_number = var_pass_number, sampling_date = var_sampling_date, source_wcgbts_id = var_source_wcgbts_id, specimen_age_sample_label = var_specimen_age_sample_label, specimen_age_years = var_specimen_age_years, specimen_finclip_sample_label = var_specimen_finclip_sample_label, specimen_life_stage_name = var_specimen_life_stage_name, specimen_ovary_sample_label = var_specimen_ovary_sample_label, specimen_sex_code = var_specimen_sex_code, specimen_size_cm = var_specimen_size_cm, specimen_size_sample_type_name = var_specimen_size_sample_type_name, specimen_stomach_sample_label = var_specimen_stomach_sample_label, specimen_tissue_sample_label = var_specimen_tissue_sample_label, specimen_weight_kg = var_specimen_weight_kg, survey_year = var_survey_year, tow_performance_name = var_tow_performance_name, vessel_name = var_vessel_name, was_actual_station_active_when_sampled = var_was_actual_station_active_when_sampled, was_target_station_active_when_sampled = var_was_target_station_active_when_sampleddata_file = "result.txt")
result <- api_instance$GetBottomTrawlSpecimens(limit = var_limit, fields = var_fields, offset = var_offset, redirect = var_redirect, data_format = var_data_format, response_mode = var_response_mode, include_noncore_fields = var_include_noncore_fields, actual_station_centroid_key = var_actual_station_centroid_key, actual_station_code = var_actual_station_code, actual_station_current_deactivation_reasons = var_actual_station_current_deactivation_reasons, actual_station_deactivation_year = var_actual_station_deactivation_year, actual_station_depth_stratum_name = var_actual_station_depth_stratum_name, actual_station_latitude_stratum_name = var_actual_station_latitude_stratum_name, ageing_lab_name = var_ageing_lab_name, age_last_analyzed_at = var_age_last_analyzed_at, age_sample_type_name = var_age_sample_type_name, best_available_taxon_category = var_best_available_taxon_category, best_available_taxon_common_name = var_best_available_taxon_common_name, best_available_taxon_is_coral = var_best_available_taxon_is_coral, best_available_taxon_is_invertebrate = var_best_available_taxon_is_invertebrate, best_available_taxon_is_pacific_salmon = var_best_available_taxon_is_pacific_salmon, best_available_taxon_is_rockfish = var_best_available_taxon_is_rockfish, best_available_taxon_is_sponge = var_best_available_taxon_is_sponge, best_available_taxon_itis_tsn = var_best_available_taxon_itis_tsn, best_available_taxon_scientific_name = var_best_available_taxon_scientific_name, best_available_taxon_subcategory = var_best_available_taxon_subcategory, best_available_taxon_worms_aphia_id = var_best_available_taxon_worms_aphia_id, best_tow_latitude_dd = var_best_tow_latitude_dd, best_tow_longitude_dd = var_best_tow_longitude_dd, bottom_trawl_operation_key = var_bottom_trawl_operation_key, data_readiness_level_code = var_data_readiness_level_code, data_readiness_level_display_name = var_data_readiness_level_display_name, data_status_name = var_data_status_name, is_actual_station_currently_active = var_is_actual_station_currently_active, lab_analyzed_maturity_stage_name = var_lab_analyzed_maturity_stage_name, leg_number = var_leg_number, net_off_bottom_at = var_net_off_bottom_at, net_on_bottom_at = var_net_on_bottom_at, nmfs_project_name = var_nmfs_project_name, ovary_last_analyzed_at = var_ovary_last_analyzed_at, ovary_proportion_atresia = var_ovary_proportion_atresia, pass_number = var_pass_number, sampling_date = var_sampling_date, source_wcgbts_id = var_source_wcgbts_id, specimen_age_sample_label = var_specimen_age_sample_label, specimen_age_years = var_specimen_age_years, specimen_finclip_sample_label = var_specimen_finclip_sample_label, specimen_life_stage_name = var_specimen_life_stage_name, specimen_ovary_sample_label = var_specimen_ovary_sample_label, specimen_sex_code = var_specimen_sex_code, specimen_size_cm = var_specimen_size_cm, specimen_size_sample_type_name = var_specimen_size_sample_type_name, specimen_stomach_sample_label = var_specimen_stomach_sample_label, specimen_tissue_sample_label = var_specimen_tissue_sample_label, specimen_weight_kg = var_specimen_weight_kg, survey_year = var_survey_year, tow_performance_name = var_tow_performance_name, vessel_name = var_vessel_name, was_actual_station_active_when_sampled = var_was_actual_station_active_when_sampled, was_target_station_active_when_sampled = var_was_target_station_active_when_sampled)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **integer**| Max rows to return | [optional] 
 **fields** | list( **character** )| Comma-separated column filter | [optional] 
 **offset** | **integer**| Rows to skip before beginning to return records. | [optional] 
 **redirect** | **character**| Force S3 pre-signed redirect | [optional] 
 **data_format** | **character**| Response format: json, csv, or parquet | [optional] 
 **response_mode** | **character**| Delivery mode: data, package | [optional] 
 **include_noncore_fields** | **character**| All fields returned when true, else only core fields returned. | [optional] 
 **actual_station_centroid_key** | [**character**](.md)| A composite spatial key that uniquely identifies the centroid of a WCGBTS (West Coast Groundfish Bottom Trawl Survey) sampling station grid cell.     This key is a fixed 8-character string constructed by converting decimal degree coordinates into Degrees and Decimal Minutes (DDM), stripping away negative signs and truncating specific digits to create a consistent spatial identifier.    ### Component Breakdown  The 8-character format strictly follows the pattern **&#x60;[Lat Degrees][Lat Minutes][Lon Degrees][Lon Minutes]&#x60;**:    * **Latitude Degrees (2 characters):** The whole number of the decimal latitude (e.g., &#x60;43.58&#x60; becomes &#x60;43&#x60;).  * **Latitude Minutes (2 characters):** The decimal remainder of the latitude multiplied by 60 and rounded to the nearest whole number (e.g., &#x60;0.58139 * 60 &#x3D; 34.88&#x60;, which rounds to &#x60;35&#x60;).  * **Longitude Degrees (2 characters):** The whole number of the longitude, ignoring the negative sign (West) and dropping the leading hundreds place (e.g., &#x60;-124.61&#x60; becomes &#x60;24&#x60;).  * **Longitude Minutes (2 characters):** The decimal remainder of the longitude multiplied by 60 and rounded to the nearest whole number (e.g., &#x60;0.61465 * 60 &#x3D; 36.87&#x60;, which rounds to &#x60;37&#x60;).    &gt; **Example:** A grid cell centroid located at decimal coordinates **&#x60;43.58139678, -124.61465068&#x60;** results in the centroid key **&#x60;43352437&#x60;**. | [optional] 
 **actual_station_code** | [**character**](.md)| Unique identifier for the sampling site visited. For the West Coast Groundfish Bottom Trawl Shelf/Slope Survey, sites follow a gridded pattern. Site codes incrementing sequentially by one from North to South and West to East, with the site furthest to the North starting at 4039 and the site furthest to the south ending at 23399. Most site codes are integers, but present as text data types to accommodate historical formats which included alphanumeric values. Historical site splits are represented by floating point numbers (site 44444 split to 44444.1 and 44444.2). The \&quot;best\&quot; sampling site designation indicates that the single summarized tow/haul location falls within this site boundary. The \&quot;target\&quot; site may diverge from the \&quot;best\&quot; in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to this preferred geolocated site. | [optional] 
 **actual_station_current_deactivation_reasons** | [**character**](.md)| Comma-separated list of current reasons that a station is listed as inactive.  Value should be null unless the station is currently inactive. | [optional] 
 **actual_station_deactivation_year** | [**character**](.md)| The year YYYY when the actual station sampled was last deactivated, if the site is currently inactive. The \&quot;best\&quot; sampling site designation indicates that the single summarized tow/haul location falls within this site boundary. The \&quot;target\&quot; site may diverge from the \&quot;best\&quot; in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to this preferred geolocated site. | [optional] 
 **actual_station_depth_stratum_name** | [**character**](.md)| Name of the depth stratum that the sampling site falls into. Sampling on the West Coast Groundfish Bottom Trawl Shelf/Slope Survey follows a randomly stratified design, with sampling sites falling into one of three depth strata: 30-100 fathoms, 100-300 fathoms, and 300-700 fathoms. The \&quot;best\&quot; sampling site designation indicates that the single summarized tow/haul location falls within this site boundary. The \&quot;target\&quot; site may diverge from the \&quot;best\&quot; in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to this preferred geolocated site. | [optional] 
 **actual_station_latitude_stratum_name** | [**character**](.md)| Name of the latitude stratum that the sampling site falls into. Sampling on the West Coast Groundfish Bottom Trawl Shelf/Slope Survey follows a randomly stratified design, with sampling sites falling into one of two latitude strata: North of Point Conception (&gt;34°30&#39;N) or South of Point Conception (&lt;34°30&#39;N). The \&quot;best\&quot; sampling site designation indicates that the single summarized tow/haul location falls within this site boundary. The \&quot;target\&quot; site may diverge from the \&quot;best\&quot; in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to this preferred geolocated site. | [optional] 
 **ageing_lab_name** | [**character**](.md)| Name of the ageing lab where this specimen&#39;s age structure was analyzed and aged. | [optional] 
 **age_last_analyzed_at** | [**character**](.md)| Date the last time this specimen age structure was aged by the ageing lab | [optional] 
 **age_sample_type_name** | [**character**](.md)| Type of age sample | [optional] 
 **best_available_taxon_category** | [**character**](.md)| Broad scientific category of the taxon (e.g., Fish, Invertebrate, Mammal, Marine Plant). \&quot;Best available\&quot; designation reflects the taxonomic classification of the species after postseason review, which may be the same or different than the taxonomic classification determined in the field at time of collection. | [optional] 
 **best_available_taxon_common_name** | [**character**](.md)| Common name of the species preferred by the Northwest Fisheries Science Center. \&quot;Best available\&quot; designation reflects the taxonomic classification of the species after postseason review, which may be the same or different than the taxonomic classification determined in the field at time of collection. | [optional] 
 **best_available_taxon_is_coral** | [**character**](.md)| Boolean flag indicating if the taxon belongs to the subclass Octocorallia (corals). \&quot;Best available\&quot; designation reflects the taxonomic classification of the species after postseason review, which may be the same or different than the taxonomic classification determined in the field at time of collection. | [optional] 
 **best_available_taxon_is_invertebrate** | [**character**](.md)| Boolean flag indicating if the taxon is an invertebrate (Kingdom Animalia, excluding Subphylum Vertebrata). \&quot;Best available\&quot; designation reflects the taxonomic classification of the species after postseason review, which may be the same or different than the taxonomic classification determined in the field at time of collection. | [optional] 
 **best_available_taxon_is_pacific_salmon** | [**character**](.md)| Boolean flag indicating if the taxon belongs to the genus Oncorhynchus (Pacific salmon). \&quot;Best available\&quot; designation reflects the taxonomic classification of the species after postseason review, which may be the same or different than the taxonomic classification determined in the field at time of collection. | [optional] 
 **best_available_taxon_is_rockfish** | [**character**](.md)| Boolean flag indicating if the taxon belongs to the genus Sebastes (rockfishes). \&quot;Best available\&quot; designation reflects the taxonomic classification of the species after postseason review, which may be the same or different than the taxonomic classification determined in the field at time of collection. | [optional] 
 **best_available_taxon_is_sponge** | [**character**](.md)| Boolean flag indicating if the taxon belongs to the phylum Porifera (sponges). \&quot;Best available\&quot; designation reflects the taxonomic classification of the species after postseason review, which may be the same or different than the taxonomic classification determined in the field at time of collection. | [optional] 
 **best_available_taxon_itis_tsn** | [**character**](.md)| Taxonomic Serial Number (TSN) is a unique, stable, and persistent numeric identifier assigned by the Integrated Taxonomic Information System (ITIS) to scientific names of organisms. It serves as a non-intelligent, permanent key for tracking species, synonyms, and taxonomic changes across various databases, ensuring standardized classification of flora and fauna. \&quot;Best available\&quot; designation reflects the taxonomic classification of the species after postseason review, which may be the same or different than the taxonomic classification determined in the field at time of collection. | [optional] 
 **best_available_taxon_scientific_name** | [**character**](.md)| Scientific name or latinized nomenclature of the species caught used to uniquely identify taxonomic classification. \&quot;Best available\&quot; designation reflects the taxonomic classification of the species after postseason review, which may be the same or different than the taxonomic classification determined in the field at time of collection. | [optional] 
 **best_available_taxon_subcategory** | [**character**](.md)| More granular scientific subcategory of the taxon (e.g., Rockfish, Flatfish, Roundfish, Crab, Shrimp). \&quot;Best available\&quot; designation reflects the taxonomic classification of the species after postseason review, which may be the same or different than the taxonomic classification determined in the field at time of collection. | [optional] 
 **best_available_taxon_worms_aphia_id** | [**character**](.md)| The AphiaID is a unique, stable, and persistent numerical identifier used within the World Register of Marine Species (WoRMS) database to identify, track, and manage marine organisms, including their taxonomic classification, synonyms, and related biological traits. It serves as the core taxonomic infrastructure, ensuring data consistency and enabling integration with external biological databases. \&quot;Best available\&quot; designation reflects the taxonomic classification of the species after postseason review, which may be the same or different than the taxonomic classification determined in the field at time of collection. | [optional] 
 **best_tow_latitude_dd** | [**character**](.md)| Summarized location of the tow representing the single point in space that best represents where the tow sampling took place. Typically this location is derived by combining the median latitude and longitude of the estimated gear track wihle the gear is fishing and in contact with the bottom. Latitude presented as decimal degrees with up to eight points of precision. Latitude presented as decimal degrees with up to eight points of precision. | [optional] 
 **best_tow_longitude_dd** | [**character**](.md)| Summarized location of the tow representing the single point in space that best represents where the tow sampling took place. Typically this location is derived by combining the median latitude and longitude of the estimated gear track wihle the gear is fishing and in contact with the bottom. Longitude presented as decimal degrees with up to eight points of precision. Longitude presented as decimal degrees with up to eight points of precision. | [optional] 
 **bottom_trawl_operation_key** | [**character**](.md)| 12-character numeric unique identifier for a West Coast Groundfish Bottom Trawl sampling operation. Digits 1-4 represent the year (YYYY) of sampling, digits 5-6 represent the survey operation type, digits 7-9 represent the zero-padded vessel identifier, digits 10-12 represent the zero-padded sequential operation increment. | [optional] 
 **data_readiness_level_code** | [**character**](.md)| The code representing the data readiness level.     Values include:  * &#x60;L0&#x60;  * &#x60;L1&#x60;  * &#x60;L2&#x60;  * &#x60;L3&#x60;  * &#x60;L4&#x60; | [optional] 
 **data_readiness_level_display_name** | [**character**](.md)| The formatted display name combining the readiness level code and its status.     Values include:  * &#x60;L0 - RAW&#x60;  * &#x60;L1 - PRELIMINARY&#x60;  * &#x60;L2 - VERIFIED&#x60;  * &#x60;L3 - HARMONIZED&#x60;  * &#x60;L4 - DERIVED&#x60; | [optional] 
 **data_status_name** | [**character**](.md)| Name of the data point&#39;s current status with respect to its finalization/QC status.  Typically new data submitted directly from the field is flagged as \&quot;Under Review\&quot;,   until it is reviewed, where it is then marked as \&quot;Finalized\&quot;.  Unfinalized data may  be used for any purpose, but for fisheries stock assessment, using/filtering for  finalized data is best. | [optional] 
 **is_actual_station_currently_active** | [**character**](.md)| Boolean indicating if the actual station sampled is currently active. The \&quot;best\&quot; sampling site designation indicates that the single summarized tow/haul location falls within this site boundary. The \&quot;target\&quot; site may diverge from the \&quot;best\&quot; in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to this preferred geolocated site. | [optional] 
 **lab_analyzed_maturity_stage_name** | [**character**](.md)| Maturity designation and certainty of the designation summary. | [optional] 
 **leg_number** | [**character**](.md)| Leg increment number when a sampling operation took place.  Each vessel participating in the survey partakes in multiple legs (leg #1, #2...) as part of the survey schedule within a given pass, with each survey containing multiple passes per year.  A vessel on the WCGBTS Shelf/Slope Survey typically is scheduled for 5 legs per year, although this is subject to change due to year-to-year schedule differences. | [optional] 
 **net_off_bottom_at** | [**character**](.md)| Date and time when the footrope loses contact with the bottom after haulback has begun, marking the end of \&quot;sampling\&quot; / \&quot;fishing\&quot; for the tow. UTC Date and time with timezone offset following in ISO 8601 (&#x60;YYYY-MM-DD HH:MM:SS+00&#x60;). Timestamp is to seconds precision (no fractional seconds). | [optional] 
 **net_on_bottom_at** | [**character**](.md)| Date and time when the footrope initially makes contact with the bottom, marking the start of \&quot;sampling\&quot; / \&quot;fishing\&quot; for the tow. UTC Date and time with timezone offset following in ISO 8601 (&#x60;YYYY-MM-DD HH:MM:SS+00&#x60;). Timestamp is to seconds precision (no fractional seconds). | [optional] 
 **nmfs_project_name** | [**character**](.md)| Name of the project/survey under the National Marine Fisheries Service (NMFS) for which the data was collected. | [optional] 
 **ovary_last_analyzed_at** | [**character**](.md)| Date the last time this specimen ovary structure was aged by the maturities lab | [optional] 
 **ovary_proportion_atresia** | [**character**](.md)| The post-season measured proportion of oocytes (eggs) in the ovary sample that are undergoing atresia—the biological process of breaking down and reabsorbing unspawned eggs. A higher proportion typically indicates environmental stress, skipped spawning, or the end of a reproductive cycle as the fish recycles energy. | [optional] 
 **pass_number** | [**character**](.md)| Pass increment number when a sampling operation took place (i.e. pass #1, #2...).  Each annual survey typically has multiple passes, with each pass being assigned one or several vessels to participate in sampling. | [optional] 
 **sampling_date** | [**character**](.md)| Date when sampling took place, in YYYY-MM-DD ISO8601 format | [optional] 
 **source_wcgbts_id** | [**character**](.md)| Source specimen identifier from WCGBTS database. UUID version 7 (UUIDv7) is a time-ordered, 128-bit universally unique identifier designed to improve database performance, combining a Unix timestamp (milliseconds precision) with random data. Defined in RFC 9562, it features 48 bits for the timestamp, 74 bits for randomness/entropy, and 6 bits for version/variant. It enables ordered, index-friendly primary keys. | [optional] 
 **specimen_age_sample_label** | [**character**](.md)| Label for age sample | [optional] 
 **specimen_age_years** | [**character**](.md)| Age of the specimen determined by the ageling laboratory using the age structure collected from the specimen after capture. | [optional] 
 **specimen_finclip_sample_label** | [**character**](.md)| Label for finclip sample | [optional] 
 **specimen_life_stage_name** | [**character**](.md)| Life stage or ontogeny designation of the catch sample (i.e. egg case, larval, adult, YoY).  If not specified (it typically is not called out by scientists in the field) the catch can be assumed to be fully mature adults. | [optional] 
 **specimen_ovary_sample_label** | [**character**](.md)| Label for ovary sample | [optional] 
 **specimen_sex_code** | [**character**](.md)| Sex code | [optional] 
 **specimen_size_cm** | [**character**](.md)| Length or width in cm | [optional] 
 **specimen_size_sample_type_name** | [**character**](.md)| Type of length/width measurement taken sample | [optional] 
 **specimen_stomach_sample_label** | [**character**](.md)| Label for stomach sample | [optional] 
 **specimen_tissue_sample_label** | [**character**](.md)| Label for tissue sample | [optional] 
 **specimen_weight_kg** | [**character**](.md)| Recorded weight of the specimen in kilograms. | [optional] 
 **survey_year** | [**character**](.md)| Calendar year in integer format YYYY during which data was collected. | [optional] 
 **tow_performance_name** | [**character**](.md)| Tows should be marked as \&quot;satisfactory\&quot; or \&quot;unsatisfactory\&quot;, with satisfactory tows typically considered viable for stock assessment. | [optional] 
 **vessel_name** | [**character**](.md)| Full name of the commercial or research vessel used to collect the data at sea. | [optional] 
 **was_actual_station_active_when_sampled** | [**character**](.md)| Boolean indicating if the actual station was active at the time it was sampled. The \&quot;best\&quot; sampling site designation indicates that the single summarized tow/haul location falls within this site boundary. The \&quot;target\&quot; site may diverge from the \&quot;best\&quot; in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to this preferred geolocated site. | [optional] 
 **was_target_station_active_when_sampled** | [**character**](.md)| Boolean indicating if the target station was active at the time of sampling. The \&quot;target\&quot; sampling site designation indicates that the site was the target for sampling for the particular operation. The \&quot;target\&quot; site may diverge from the \&quot;best\&quot; in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to the \&quot;best\&quot; preferred geolocated site. | [optional] 

### Return type

[**array[BottomTrawlSpecimens]**](bottom_trawl_specimens.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/csv, application/zip, application/vnd.apache.parquet

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Success |  -  |
| **302** | Redirect to S3 for large sets or alternative formats |  * Location - The pre-signed S3 URL <br>  |

# **GetBottomTrawlStationSearches**
> array[BottomTrawlStationSearches] GetBottomTrawlStationSearches(limit = var.limit, fields = var.fields, offset = var.offset, redirect = var.redirect, data_format = var.data_format, response_mode = var.response_mode, include_noncore_fields = var.include_noncore_fields, bottom_trawl_operation_key = var.bottom_trawl_operation_key, captain_name = var.captain_name, field_party_chief_name = var.field_party_chief_name, leg_number = var.leg_number, nmfs_project_name = var.nmfs_project_name, pass_number = var.pass_number, search_elapsed_time_s = var.search_elapsed_time_s, search_ended_at = var.search_ended_at, search_notes = var.search_notes, search_result_type_name = var.search_result_type_name, search_started_at = var.search_started_at, survey_year = var.survey_year, target_station_code = var.target_station_code, untrawlable_site_reason_name = var.untrawlable_site_reason_name, vessel_name = var.vessel_name)

West Coast Bottom Trawl Station Searches

Report storing one record per station search operation on the West Coast Groundfish Bottom Trawl Shelf/Slope Survey. A search is performed when first assessing a sampling station for trawlability. The vessel will search a cell for up to an hour before determining one of the following outcomes:    * **A.** Station is trawlable and will be sampled now  * **B.** Station is trawlable and will be sampled later  * **C.** Station is not trawlable now due to temporary circumstances (e.g., weather, commercial fishing gear, military presence)  * **D.** Station is not trawlable and is likely permanently untrawlable (e.g., due to harsh bottom features)    > **Note:** Typically, scientists and crew are required to search a given site for at least an hour before deeming it untrawlable,   but circumstances may cause this time requirement to be missed or shortened.

### Example
```R
library(nwfscDataCatalog)

# West Coast Bottom Trawl Station Searches
#
# prepare function argument(s)
var_limit <- 56 # integer | Max rows to return (Optional)
var_fields <- c("inner_example") # array[character] | Comma-separated column filter (Optional)
var_offset <- 56 # integer | Rows to skip before beginning to return records. (Optional)
var_redirect <- "redirect_example" # character | Force S3 pre-signed redirect (Optional)
var_data_format <- "data_format_example" # character | Response format: json, csv, or parquet (Optional)
var_response_mode <- "response_mode_example" # character | Delivery mode: data, package (Optional)
var_include_noncore_fields <- "include_noncore_fields_example" # character | All fields returned when true, else only core fields returned. (Optional)
var_bottom_trawl_operation_key <- "bottom_trawl_operation_key_example" # character | A 12-character numeric unique identifier for a West Coast Groundfish Bottom Trawl sampling operation.     It is constructed by concatenating key operational attributes into a single string. For example, the operation key **`202203020001`** breaks down as follows:    * **Survey Year (Digits 1-4):** The 4-digit year (YYYY) of sampling (e.g., `2022`).  * **Operation Type (Digits 5-6):** The 2-digit code representing the survey operation type (e.g., `03`).  * **Vessel ID (Digits 7-9):** The 3-digit, zero-padded identifier for the participating vessel (e.g., `020`).  * **Operation Increment (Digits 10-12):** The 3-digit, zero-padded sequential operation increment (e.g., `001`). (Optional)
var_captain_name <- "captain_name_example" # character | Full name of the vessel captain. (Optional)
var_field_party_chief_name <- "field_party_chief_name_example" # character | Full name of the field party chief. (Optional)
var_leg_number <- "leg_number_example" # character | Leg increment number when a sampling operation took place.  Each vessel participating in the survey partakes in multiple legs (leg #1, #2...) as part of the survey schedule within a given pass, with each survey containing multiple passes per year.  A vessel on the WCGBTS Shelf/Slope Survey typically is scheduled for 5 legs per year, although this is subject to change due to year-to-year schedule differences. (Optional)
var_nmfs_project_name <- "nmfs_project_name_example" # character | Name of the project/survey under the National Marine Fisheries Service (NMFS) for which the data was collected. (Optional)
var_pass_number <- "pass_number_example" # character | Pass increment number when a sampling operation took place (i.e. pass #1, #2...).  Each annual survey typically has multiple passes, with each pass being assigned one or several vessels to participate in sampling. (Optional)
var_search_elapsed_time_s <- "search_elapsed_time_s_example" # character | The elapsed duration of the search operation in seconds. (Optional)
var_search_ended_at <- "search_ended_at_example" # character | The timestamp when the search operation ended. (Optional)
var_search_notes <- "search_notes_example" # character | Notes and field remarks recorded during the station search. (Optional)
var_search_result_type_name <- "search_result_type_name_example" # character | Description name of the search result type. (Optional)
var_search_started_at <- "search_started_at_example" # character | The timestamp when the search operation started. (Optional)
var_survey_year <- "survey_year_example" # character | Calendar year in integer format YYYY during which data was collected. (Optional)
var_target_station_code <- "target_station_code_example" # character | Code of the target sampling site station. (Optional)
var_untrawlable_site_reason_name <- "untrawlable_site_reason_name_example" # character | Description of the untrawlable reason. (Optional)
var_vessel_name <- "vessel_name_example" # character | Full name of the commercial or research vessel used to collect the data at sea. (Optional)

api_instance <- DefaultApi$new()
# to save the result into a file, simply add the optional `data_file` parameter, e.g.
# result <- api_instance$GetBottomTrawlStationSearches(limit = var_limit, fields = var_fields, offset = var_offset, redirect = var_redirect, data_format = var_data_format, response_mode = var_response_mode, include_noncore_fields = var_include_noncore_fields, bottom_trawl_operation_key = var_bottom_trawl_operation_key, captain_name = var_captain_name, field_party_chief_name = var_field_party_chief_name, leg_number = var_leg_number, nmfs_project_name = var_nmfs_project_name, pass_number = var_pass_number, search_elapsed_time_s = var_search_elapsed_time_s, search_ended_at = var_search_ended_at, search_notes = var_search_notes, search_result_type_name = var_search_result_type_name, search_started_at = var_search_started_at, survey_year = var_survey_year, target_station_code = var_target_station_code, untrawlable_site_reason_name = var_untrawlable_site_reason_name, vessel_name = var_vessel_namedata_file = "result.txt")
result <- api_instance$GetBottomTrawlStationSearches(limit = var_limit, fields = var_fields, offset = var_offset, redirect = var_redirect, data_format = var_data_format, response_mode = var_response_mode, include_noncore_fields = var_include_noncore_fields, bottom_trawl_operation_key = var_bottom_trawl_operation_key, captain_name = var_captain_name, field_party_chief_name = var_field_party_chief_name, leg_number = var_leg_number, nmfs_project_name = var_nmfs_project_name, pass_number = var_pass_number, search_elapsed_time_s = var_search_elapsed_time_s, search_ended_at = var_search_ended_at, search_notes = var_search_notes, search_result_type_name = var_search_result_type_name, search_started_at = var_search_started_at, survey_year = var_survey_year, target_station_code = var_target_station_code, untrawlable_site_reason_name = var_untrawlable_site_reason_name, vessel_name = var_vessel_name)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **integer**| Max rows to return | [optional] 
 **fields** | list( **character** )| Comma-separated column filter | [optional] 
 **offset** | **integer**| Rows to skip before beginning to return records. | [optional] 
 **redirect** | **character**| Force S3 pre-signed redirect | [optional] 
 **data_format** | **character**| Response format: json, csv, or parquet | [optional] 
 **response_mode** | **character**| Delivery mode: data, package | [optional] 
 **include_noncore_fields** | **character**| All fields returned when true, else only core fields returned. | [optional] 
 **bottom_trawl_operation_key** | [**character**](.md)| A 12-character numeric unique identifier for a West Coast Groundfish Bottom Trawl sampling operation.     It is constructed by concatenating key operational attributes into a single string. For example, the operation key **&#x60;202203020001&#x60;** breaks down as follows:    * **Survey Year (Digits 1-4):** The 4-digit year (YYYY) of sampling (e.g., &#x60;2022&#x60;).  * **Operation Type (Digits 5-6):** The 2-digit code representing the survey operation type (e.g., &#x60;03&#x60;).  * **Vessel ID (Digits 7-9):** The 3-digit, zero-padded identifier for the participating vessel (e.g., &#x60;020&#x60;).  * **Operation Increment (Digits 10-12):** The 3-digit, zero-padded sequential operation increment (e.g., &#x60;001&#x60;). | [optional] 
 **captain_name** | [**character**](.md)| Full name of the vessel captain. | [optional] 
 **field_party_chief_name** | [**character**](.md)| Full name of the field party chief. | [optional] 
 **leg_number** | [**character**](.md)| Leg increment number when a sampling operation took place.  Each vessel participating in the survey partakes in multiple legs (leg #1, #2...) as part of the survey schedule within a given pass, with each survey containing multiple passes per year.  A vessel on the WCGBTS Shelf/Slope Survey typically is scheduled for 5 legs per year, although this is subject to change due to year-to-year schedule differences. | [optional] 
 **nmfs_project_name** | [**character**](.md)| Name of the project/survey under the National Marine Fisheries Service (NMFS) for which the data was collected. | [optional] 
 **pass_number** | [**character**](.md)| Pass increment number when a sampling operation took place (i.e. pass #1, #2...).  Each annual survey typically has multiple passes, with each pass being assigned one or several vessels to participate in sampling. | [optional] 
 **search_elapsed_time_s** | [**character**](.md)| The elapsed duration of the search operation in seconds. | [optional] 
 **search_ended_at** | [**character**](.md)| The timestamp when the search operation ended. | [optional] 
 **search_notes** | [**character**](.md)| Notes and field remarks recorded during the station search. | [optional] 
 **search_result_type_name** | [**character**](.md)| Description name of the search result type. | [optional] 
 **search_started_at** | [**character**](.md)| The timestamp when the search operation started. | [optional] 
 **survey_year** | [**character**](.md)| Calendar year in integer format YYYY during which data was collected. | [optional] 
 **target_station_code** | [**character**](.md)| Code of the target sampling site station. | [optional] 
 **untrawlable_site_reason_name** | [**character**](.md)| Description of the untrawlable reason. | [optional] 
 **vessel_name** | [**character**](.md)| Full name of the commercial or research vessel used to collect the data at sea. | [optional] 

### Return type

[**array[BottomTrawlStationSearches]**](bottom_trawl_station_searches.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/csv, application/zip, application/vnd.apache.parquet

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Success |  -  |
| **302** | Redirect to S3 for large sets or alternative formats |  * Location - The pre-signed S3 URL <br>  |

# **GetBottomTrawlTows**
> array[BottomTrawlTows] GetBottomTrawlTows(limit = var.limit, fields = var.fields, offset = var.offset, redirect = var.redirect, data_format = var.data_format, response_mode = var.response_mode, include_noncore_fields = var.include_noncore_fields, actual_station_centroid_key = var.actual_station_centroid_key, actual_station_code = var.actual_station_code, actual_station_current_deactivation_reasons = var.actual_station_current_deactivation_reasons, actual_station_deactivation_year = var.actual_station_deactivation_year, actual_station_depth_stratum_name = var.actual_station_depth_stratum_name, actual_station_latitude_stratum_name = var.actual_station_latitude_stratum_name, best_tow_latitude_dd = var.best_tow_latitude_dd, best_tow_location_calculation_method_name = var.best_tow_location_calculation_method_name, best_tow_longitude_dd = var.best_tow_longitude_dd, bottom_trawl_operation_key = var.bottom_trawl_operation_key, captain_name = var.captain_name, data_readiness_level_code = var.data_readiness_level_code, data_readiness_level_display_name = var.data_readiness_level_display_name, data_status_name = var.data_status_name, direction_to_current_name = var.direction_to_current_name, doors_out_at = var.doors_out_at, doors_out_vessel_latitude_dd = var.doors_out_vessel_latitude_dd, doors_out_vessel_longitude_dd = var.doors_out_vessel_longitude_dd, doors_set_at = var.doors_set_at, doors_set_vessel_latitude_dd = var.doors_set_vessel_latitude_dd, doors_set_vessel_longitude_dd = var.doors_set_vessel_longitude_dd, doors_up_at = var.doors_up_at, doors_up_vessel_latitude_dd = var.doors_up_vessel_latitude_dd, doors_up_vessel_longitude_dd = var.doors_up_vessel_longitude_dd, field_party_chief_name = var.field_party_chief_name, invertebrate_catch_weight_kg = var.invertebrate_catch_weight_kg, is_actual_station_currently_active = var.is_actual_station_currently_active, is_tow_performance_satisfactory = var.is_tow_performance_satisfactory, leg_number = var.leg_number, net_off_bottom_at = var.net_off_bottom_at, net_off_bottom_gear_latitude_dd = var.net_off_bottom_gear_latitude_dd, net_off_bottom_gear_longitude_dd = var.net_off_bottom_gear_longitude_dd, net_off_bottom_vessel_latitude_dd = var.net_off_bottom_vessel_latitude_dd, net_off_bottom_vessel_longitude_dd = var.net_off_bottom_vessel_longitude_dd, net_on_bottom_at = var.net_on_bottom_at, net_on_bottom_gear_latitude_dd = var.net_on_bottom_gear_latitude_dd, net_on_bottom_gear_longitude_dd = var.net_on_bottom_gear_longitude_dd, net_on_bottom_vessel_latitude_dd = var.net_on_bottom_vessel_latitude_dd, net_on_bottom_vessel_longitude_dd = var.net_on_bottom_vessel_longitude_dd, nmfs_project_name = var.nmfs_project_name, nonspecific_organics_catch_weight_kg = var.nonspecific_organics_catch_weight_kg, on_bottom_dissolved_oxygen_ml_per_l = var.on_bottom_dissolved_oxygen_ml_per_l, on_bottom_distance_fished_m = var.on_bottom_distance_fished_m, on_bottom_elapsed_time_s = var.on_bottom_elapsed_time_s, on_bottom_net_door_spread_m = var.on_bottom_net_door_spread_m, on_bottom_net_headrope_depth_m = var.on_bottom_net_headrope_depth_m, on_bottom_net_headrope_height_m = var.on_bottom_net_headrope_height_m, on_bottom_net_wing_spread_m = var.on_bottom_net_wing_spread_m, on_bottom_salinity_psu = var.on_bottom_salinity_psu, on_bottom_seafloor_depth_calculation_method_name = var.on_bottom_seafloor_depth_calculation_method_name, on_bottom_seafloor_depth_m = var.on_bottom_seafloor_depth_m, on_bottom_water_conductivity_ml_per_m3 = var.on_bottom_water_conductivity_ml_per_m3, on_bottom_water_density_kg_per_m3 = var.on_bottom_water_density_kg_per_m3, on_bottom_water_pressure_dbar = var.on_bottom_water_pressure_dbar, on_bottom_water_temperature_c = var.on_bottom_water_temperature_c, on_bottom_water_turbidity_ntu = var.on_bottom_water_turbidity_ntu, pass_number = var.pass_number, sampling_date = var.sampling_date, scientist_1_name = var.scientist_1_name, scientist_2_name = var.scientist_2_name, scientist_3_name = var.scientist_3_name, scientist_4_name = var.scientist_4_name, seafloor_area_swept_ha = var.seafloor_area_swept_ha, seafloor_area_swept_km2 = var.seafloor_area_swept_km2, started_haulback_at = var.started_haulback_at, started_haulback_gear_latitude_dd = var.started_haulback_gear_latitude_dd, started_haulback_gear_longitude_dd = var.started_haulback_gear_longitude_dd, started_haulback_vessel_latitude_dd = var.started_haulback_vessel_latitude_dd, started_haulback_vessel_longitude_dd = var.started_haulback_vessel_longitude_dd, survey_year = var.survey_year, swell_direction_code = var.swell_direction_code, swell_height_ft = var.swell_height_ft, target_station_code = var.target_station_code, total_catch_weight_kg = var.total_catch_weight_kg, tow_performance_name = var.tow_performance_name, tow_sea_surface_fluorescence_mg_per_m3 = var.tow_sea_surface_fluorescence_mg_per_m3, tow_sea_surface_water_temperature_c = var.tow_sea_surface_water_temperature_c, tow_sequence_number = var.tow_sequence_number, tow_started_at = var.tow_started_at, tow_started_vessel_latitude_dd = var.tow_started_vessel_latitude_dd, tow_started_vessel_longitude_dd = var.tow_started_vessel_longitude_dd, vertebrate_catch_weight_kg = var.vertebrate_catch_weight_kg, vessel_name = var.vessel_name, was_actual_station_active_when_sampled = var.was_actual_station_active_when_sampled, was_target_station_active_when_sampled = var.was_target_station_active_when_sampled, wave_direction_code = var.wave_direction_code, wave_height_ft = var.wave_height_ft)

West Coast Bottom Trawl Tows

Report storing one record per groundfish bottom trawl tow/haul sampling operation along the West Coast.     Tows from the following West Coast Bottom Trawl Groundfish surveys are included in this report:    * **West Coast Groundfish Bottom Trawl Slope/Shelf Combination Survey** (2003 – Present)  * **West Coast Groundfish Bottom Trawl Slope Survey** (1998 – 2002)  * **West Coast Groundfish Bottom Trawl Shelf Survey** (2001)  * **West Coast Groundfish Bottom Trawl Hypoxia Study** (2007 – 2011)  * **West Coast Groundfish Bottom Trawl Video Study** (2009)  * **AFSC/RACE Triennial Groundfish Surveys** (1977 – 2001)    Included in this report are tow-level net mensuration statistics, various spatiotemporal data points related to vessel and gear positioning,   qualitative and quantitative environmental metrics, aggregate catch weight values, personnel and scheduling information,   and overall tow performance. Availability of individual data points may vary between surveys.    > **Note on Survey Comparability:** Because the Slope and Shelf series are based on distinct statistical designs,   they are generally not amenable to combined long-term time series analysis. Analysts should filter by the project field to isolate consistent data series.

### Example
```R
library(nwfscDataCatalog)

# West Coast Bottom Trawl Tows
#
# prepare function argument(s)
var_limit <- 56 # integer | Max rows to return (Optional)
var_fields <- c("inner_example") # array[character] | Comma-separated column filter (Optional)
var_offset <- 56 # integer | Rows to skip before beginning to return records. (Optional)
var_redirect <- "redirect_example" # character | Force S3 pre-signed redirect (Optional)
var_data_format <- "data_format_example" # character | Response format: json, csv, or parquet (Optional)
var_response_mode <- "response_mode_example" # character | Delivery mode: data, package (Optional)
var_include_noncore_fields <- "include_noncore_fields_example" # character | All fields returned when true, else only core fields returned. (Optional)
var_actual_station_centroid_key <- "actual_station_centroid_key_example" # character | A composite spatial key that uniquely identifies the centroid of a WCGBTS (West Coast Groundfish Bottom Trawl Survey) sampling station grid cell.     This key is a fixed 8-character string constructed by converting decimal degree coordinates into Degrees and Decimal Minutes (DDM), stripping away negative signs and truncating specific digits to create a consistent spatial identifier.    ### Component Breakdown  The 8-character format strictly follows the pattern **`[Lat Degrees][Lat Minutes][Lon Degrees][Lon Minutes]`**:    * **Latitude Degrees (2 characters):** The whole number of the decimal latitude (e.g., `43.58` becomes `43`).  * **Latitude Minutes (2 characters):** The decimal remainder of the latitude multiplied by 60 and rounded to the nearest whole number (e.g., `0.58139 * 60 = 34.88`, which rounds to `35`).  * **Longitude Degrees (2 characters):** The whole number of the longitude, ignoring the negative sign (West) and dropping the leading hundreds place (e.g., `-124.61` becomes `24`).  * **Longitude Minutes (2 characters):** The decimal remainder of the longitude multiplied by 60 and rounded to the nearest whole number (e.g., `0.61465 * 60 = 36.87`, which rounds to `37`).    > **Example:** A grid cell centroid located at decimal coordinates **`43.58139678, -124.61465068`** results in the centroid key **`43352437`**. (Optional)
var_actual_station_code <- "actual_station_code_example" # character | Unique identifier for the sampling site visited. For the West Coast Groundfish Bottom Trawl Shelf/Slope Survey, sites follow a gridded pattern. Site codes incrementing sequentially by one from North to South and West to East, with the site furthest to the North starting at 4039 and the site furthest to the south ending at 23399. Most site codes are integers, but present as text data types to accommodate historical formats which included alphanumeric values. Historical site splits are represented by floating point numbers (site 44444 split to 44444.1 and 44444.2). The \"best\" sampling site designation indicates that the single summarized tow/haul location falls within this site boundary. The \"target\" site may diverge from the \"best\" in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to this preferred geolocated site. (Optional)
var_actual_station_current_deactivation_reasons <- "actual_station_current_deactivation_reasons_example" # character | Comma-separated list of current reasons that a station is listed as inactive.  Value should be null unless the station is currently inactive. (Optional)
var_actual_station_deactivation_year <- "actual_station_deactivation_year_example" # character | The year YYYY when the actual station sampled was last deactivated, if the site is currently inactive. The \"best\" sampling site designation indicates that the single summarized tow/haul location falls within this site boundary. The \"target\" site may diverge from the \"best\" in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to this preferred geolocated site. (Optional)
var_actual_station_depth_stratum_name <- "actual_station_depth_stratum_name_example" # character | Name of the depth stratum that the sampling site falls into. Sampling on the West Coast Groundfish Bottom Trawl Shelf/Slope Survey follows a randomly stratified design, with sampling sites falling into one of three depth strata: 30-100 fathoms, 100-300 fathoms, and 300-700 fathoms. The \"best\" sampling site designation indicates that the single summarized tow/haul location falls within this site boundary. The \"target\" site may diverge from the \"best\" in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to this preferred geolocated site. (Optional)
var_actual_station_latitude_stratum_name <- "actual_station_latitude_stratum_name_example" # character | Name of the latitude stratum that the sampling site falls into. Sampling on the West Coast Groundfish Bottom Trawl Shelf/Slope Survey follows a randomly stratified design, with sampling sites falling into one of two latitude strata: North of Point Conception (>34°30'N) or South of Point Conception (<34°30'N). The \"best\" sampling site designation indicates that the single summarized tow/haul location falls within this site boundary. The \"target\" site may diverge from the \"best\" in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to this preferred geolocated site. (Optional)
var_best_tow_latitude_dd <- "best_tow_latitude_dd_example" # character | Latitude of the single point in space that best represents where the tow sampling took place. Latitude presented as decimal degrees with up to eight points of precision. (Optional)
var_best_tow_location_calculation_method_name <- "best_tow_location_calculation_method_name_example" # character | Calculation method used to determine the single \"best\" location for a tow.  For Shelf/Slope tows, the preferred and primary method to date is to identify the  median latitude and median longitude values of the on-bottom estimated gear track, and combine to derive the best location.  Only in the absence of data  used to estimate the gear track is an alternative method typically used. (Optional)
var_best_tow_longitude_dd <- "best_tow_longitude_dd_example" # character | Longitude of the single point in space that best represents where the tow sampling took place. Longitude presented as decimal degrees with up to eight points of precision. (Optional)
var_bottom_trawl_operation_key <- "bottom_trawl_operation_key_example" # character | A 12-character numeric unique identifier for a West Coast Groundfish Bottom Trawl sampling operation.     It is constructed by concatenating key operational attributes into a single string. For example, the operation key **`202203020001`** breaks down as follows:    * **Survey Year (Digits 1-4):** The 4-digit year (YYYY) of sampling (e.g., `2022`).  * **Operation Type (Digits 5-6):** The 2-digit code representing the survey operation type (e.g., `03`).  * **Vessel ID (Digits 7-9):** The 3-digit, zero-padded identifier for the participating vessel (e.g., `020`).  * **Operation Increment (Digits 10-12):** The 3-digit, zero-padded sequential operation increment (e.g., `001`). (Optional)
var_captain_name <- "captain_name_example" # character | The captain or skipper in charge of operating the vessel during an operation's sampling. (Optional)
var_data_readiness_level_code <- "data_readiness_level_code_example" # character | The code representing the data readiness level (Data Readiness Index). Readiness levels classify data across a spectrum from raw field collection to fully validated, analysis-ready products, and can be applied at the most granular level possible (entire datasets or specific row subsets).    Values include:  * **`L0` (RAW):** Unaltered sensor or field output. Contains noise and errors. Intended for technical diagnostics and engineering review.  * **`L1` (PRELIMINARY):** Ingested and schema-validated. Technical QC complete; Scientific PI review pending. Intended for in-season pulse checks and preliminary trends.  * **`L2` (VERIFIED):** Finalized after Scientific PI Review and QA/QC audits. Intended for authoritative Stock Assessments and publication.  * **`L3` (HARMONIZED):** Integrated across multi-year programs or disparate surveys using standard taxonomies and units.  * **`L4` (DERIVED):** High-value analytic products, aggregations (e.g., CPUE indices), or model-based spatial grids. (Optional)
var_data_readiness_level_display_name <- "data_readiness_level_display_name_example" # character | The formatted display name representing the data readiness level, combining the level code and its status label.    Values include:  * **`L0 - RAW`:** Unaltered sensor or field output containing noise and errors.  * **`L1 - PRELIMINARY`:** Ingested and schema-validated, pending Scientific PI review.  * **`L2 - VERIFIED`:** Finalized after Scientific PI Review and QA/QC audits.  * **`L3 - HARMONIZED`:** Integrated across multi-year programs or disparate surveys.  * **`L4 - DERIVED`:** High-value analytic products, aggregations, or model-based spatial grids. (Optional)
var_data_status_name <- "data_status_name_example" # character | Name of the data point's current status with respect to its finalization/QC status.  Typically new data submitted directly from the field is flagged as \"Under Review\",   until it is reviewed, where it is then marked as \"Finalized\".  Unfinalized data may  be used for any purpose, but for fisheries stock assessment, using/filtering for  finalized data is best. (Optional)
var_direction_to_current_name <- "direction_to_current_name_example" # character | Direction of the vessel relative to the current. (Optional)
var_doors_out_at <- "doors_out_at_example" # character | when the trawl doors are fully out, wire is fully deployed, and winch is stopped. UTC Date and time with timezone offset following in ISO 8601 (`YYYY-MM-DD HH:MM:SS+00`). Timestamp is to seconds precision (no fractional seconds). (Optional)
var_doors_out_vessel_latitude_dd <- "doors_out_vessel_latitude_dd_example" # character | Latitude of the vessel when the trawl doors are fully out, wire is wire fully deployed, and winch is stopped. Latitude presented as decimal degrees with up to eight points of precision. (Optional)
var_doors_out_vessel_longitude_dd <- "doors_out_vessel_longitude_dd_example" # character | Longitude of the vessel when the trawl doors are fully out, wire is wire fully deployed, and winch is stopped. Longitude presented as decimal degrees with up to eight points of precision. (Optional)
var_doors_set_at <- "doors_set_at_example" # character | when the trawl doors were set after gear was deployed. UTC Date and time with timezone offset following in ISO 8601 (`YYYY-MM-DD HH:MM:SS+00`). Timestamp is to seconds precision (no fractional seconds). (Optional)
var_doors_set_vessel_latitude_dd <- "doors_set_vessel_latitude_dd_example" # character | Latitude of the vessel when the trawl doors were set after gear was deployed. Latitude presented as decimal degrees with up to eight points of precision. (Optional)
var_doors_set_vessel_longitude_dd <- "doors_set_vessel_longitude_dd_example" # character | Longitude of the vessel when the trawl doors were set after gear was deployed. Longitude presented as decimal degrees with up to eight points of precision. (Optional)
var_doors_up_at <- "doors_up_at_example" # character | when the trawl doors are first visible at the sea surface from the deck/wheelhouse. UTC Date and time with timezone offset following in ISO 8601 (`YYYY-MM-DD HH:MM:SS+00`). Timestamp is to seconds precision (no fractional seconds). (Optional)
var_doors_up_vessel_latitude_dd <- "doors_up_vessel_latitude_dd_example" # character | Latitude of the vessel when the trawl doors are first visible at the sea surface from the deck/wheelhouse. Latitude presented as decimal degrees with up to eight points of precision. (Optional)
var_doors_up_vessel_longitude_dd <- "doors_up_vessel_longitude_dd_example" # character | Longitude of the vessel when the trawl doors are first visible at the sea surface from the deck/wheelhouse. Longitude presented as decimal degrees with up to eight points of precision. (Optional)
var_field_party_chief_name <- "field_party_chief_name_example" # character | The operation's Field Party Chief abbreviated as FPC. The FPC leads all survey sampling and serves as the primary point of contact for data collection methods and operations while at sea. (Optional)
var_invertebrate_catch_weight_kg <- "invertebrate_catch_weight_kg_example" # character | The aggregate total weight of all invertebrates caught on tow, measured in kg. (Optional)
var_is_actual_station_currently_active <- "is_actual_station_currently_active_example" # character | Boolean indicating if the actual station sampled is currently active. The \"best\" sampling site designation indicates that the single summarized tow/haul location falls within this site boundary. The \"target\" site may diverge from the \"best\" in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to this preferred geolocated site. (Optional)
var_is_tow_performance_satisfactory <- "is_tow_performance_satisfactory_example" # character | Flag indicating if the tow was performed according to protocols. (Optional)
var_leg_number <- "leg_number_example" # character | Leg increment number when a sampling operation took place. Each vessel participating in the survey partakes in multiple legs (leg #1, #2...) as part of the survey schedule within a given pass, with each survey containing multiple passes per year. A vessel on the WCGBTS Shelf/Slope Survey typically is scheduled for 5 legs per year, although this is subject to change due to year-to-year schedule differences. (Optional)
var_net_off_bottom_at <- "net_off_bottom_at_example" # character | when the footrope loses contact with the bottom after haulback has begun, marking the end of \"sampling\" / \"fishing\" for the tow. UTC Date and time with timezone offset following in ISO 8601 (`YYYY-MM-DD HH:MM:SS+00`). Timestamp is to seconds precision (no fractional seconds). (Optional)
var_net_off_bottom_gear_latitude_dd <- "net_off_bottom_gear_latitude_dd_example" # character | Latitude of the gear/net when the footrope loses contact with the bottom after haulback has begun, marking the end of \"sampling\" / \"fishing\" for the tow. Latitude presented as decimal degrees with up to eight points of precision. (Optional)
var_net_off_bottom_gear_longitude_dd <- "net_off_bottom_gear_longitude_dd_example" # character | Longitude of the gear/net when the footrope loses contact with the bottom after haulback has begun, marking the end of \"sampling\" / \"fishing\" for the tow. Longitude presented as decimal degrees with up to eight points of precision. (Optional)
var_net_off_bottom_vessel_latitude_dd <- "net_off_bottom_vessel_latitude_dd_example" # character | Latitude of the vessel when the footrope loses contact with the bottom after haulback has begun, marking the end of \"sampling\" / \"fishing\" for the tow. Latitude presented as decimal degrees with up to eight points of precision. (Optional)
var_net_off_bottom_vessel_longitude_dd <- "net_off_bottom_vessel_longitude_dd_example" # character | Longitude of the vessel when the footrope loses contact with the bottom after haulback has begun, marking the end of \"sampling\" / \"fishing\" for the tow. Longitude presented as decimal degrees with up to eight points of precision. (Optional)
var_net_on_bottom_at <- "net_on_bottom_at_example" # character | when the footrope initially makes contact with the bottom, marking the start of \"sampling\" / \"fishing\" for the tow. UTC Date and time with timezone offset following in ISO 8601 (`YYYY-MM-DD HH:MM:SS+00`). Timestamp is to seconds precision (no fractional seconds). (Optional)
var_net_on_bottom_gear_latitude_dd <- "net_on_bottom_gear_latitude_dd_example" # character | Latitude of the gear/net when the footrope initially makes contact with the bottom, marking the start of \"sampling\" / \"fishing\" for the tow. Latitude presented as decimal degrees with up to eight points of precision. (Optional)
var_net_on_bottom_gear_longitude_dd <- "net_on_bottom_gear_longitude_dd_example" # character | Longitude of the gear/net when the footrope initially makes contact with the bottom, marking the start of \"sampling\" / \"fishing\" for the tow. Longitude presented as decimal degrees with up to eight points of precision. (Optional)
var_net_on_bottom_vessel_latitude_dd <- "net_on_bottom_vessel_latitude_dd_example" # character | Latitude of the vessel when the footrope initially makes contact with the bottom, marking the start of \"sampling\" / \"fishing\" for the tow. Latitude presented as decimal degrees with up to eight points of precision. (Optional)
var_net_on_bottom_vessel_longitude_dd <- "net_on_bottom_vessel_longitude_dd_example" # character | Longitude of the vessel when the footrope initially makes contact with the bottom, marking the start of \"sampling\" / \"fishing\" for the tow. Longitude presented as decimal degrees with up to eight points of precision. (Optional)
var_nmfs_project_name <- "nmfs_project_name_example" # character | Name of the project/survey under the National Marine Fisheries Service (NMFS) for which the data was collected. (Optional)
var_nonspecific_organics_catch_weight_kg <- "nonspecific_organics_catch_weight_kg_example" # character | The aggregate total weight of nonspecific organic catch samples caught on tow, measured in kg. To date this category includes the following: gelatinous material unident., unsorted shab, decomposed fish, Echinoidea (crushed urchin), empty bivalve shells, empty gastropod shells, nonspecific egg-case unident. (Optional)
var_on_bottom_dissolved_oxygen_ml_per_l <- "on_bottom_dissolved_oxygen_ml_per_l_example" # character | dissolved oxygen measured in ml/L. (Optional)
var_on_bottom_distance_fished_m <- "on_bottom_distance_fished_m_example" # character | Estimated distance in meters that the net was in contact with the bottom and fishing. This metric contributes directly to area swept and resulting CPUE (distance fished X derived net wing spread = area swept). (Optional)
var_on_bottom_elapsed_time_s <- "on_bottom_elapsed_time_s_example" # character | Total time the net was on the seafloor in seconds. (Optional)
var_on_bottom_net_door_spread_m <- "on_bottom_net_door_spread_m_example" # character | the spread distance in meters of the trawl doors. While fishing on the WCGBTS Shelf/Slope survey this metric typically ranges from 30-50 meters, and may be used to predict corresponding wing spread for the tow if no wing spread is available. (Optional)
var_on_bottom_net_headrope_depth_m <- "on_bottom_net_headrope_depth_m_example" # character | the depth in meters of the net's headrope from the sea surface. The sum of this metric and the headrope's height is often used to estimate total seafloor depth. (Optional)
var_on_bottom_net_headrope_height_m <- "on_bottom_net_headrope_height_m_example" # character | the distance in meters between the net's headrope and the seafloor. The sum of this metric and the headrope's depth is often used to estimate total seafloor depth. (Optional)
var_on_bottom_net_wing_spread_m <- "on_bottom_net_wing_spread_m_example" # character | the spread distance in meters of the trawl net wings. This value is typically used as the best proxy for the width of the area covered by the net while fishing. (Optional)
var_on_bottom_salinity_psu <- "on_bottom_salinity_psu_example" # character | water salinity measured in practical salinity units (PSUs). (Optional)
var_on_bottom_seafloor_depth_calculation_method_name <- "on_bottom_seafloor_depth_calculation_method_name_example" # character | Name of the calculation method used to derive the best seafloor depth while the net was fishing on the bottom. (Optional)
var_on_bottom_seafloor_depth_m <- "on_bottom_seafloor_depth_m_example" # character | the depth of the seafloor to sea surface surface in meters. (Optional)
var_on_bottom_water_conductivity_ml_per_m3 <- "on_bottom_water_conductivity_ml_per_m3_example" # character | water conductivity. (Optional)
var_on_bottom_water_density_kg_per_m3 <- "on_bottom_water_density_kg_per_m3_example" # character | water density measured in kg/m3. (Optional)
var_on_bottom_water_pressure_dbar <- "on_bottom_water_pressure_dbar_example" # character | water pressure measured in decibars (dbar). (Optional)
var_on_bottom_water_temperature_c <- "on_bottom_water_temperature_c_example" # character | seafloor water temperature measured in degrees Celsius. (Optional)
var_on_bottom_water_turbidity_ntu <- "on_bottom_water_turbidity_ntu_example" # character | turbidity measured in Nephelometric Turbidity Units (NTUs). (Optional)
var_pass_number <- "pass_number_example" # character | Pass increment number when a sampling operation took place (i.e. pass #1, #2...). Each annual survey typically has multiple passes, with each pass being assigned one or several vessels to participate in sampling. (Optional)
var_sampling_date <- "sampling_date_example" # character | Date when sampling took place, in YYYY-MM-DD ISO8601 format (Optional)
var_scientist_1_name <- "scientist_1_name_example" # character | The full name of the first scientist/biologist participating in the tow. (Optional)
var_scientist_2_name <- "scientist_2_name_example" # character | The full name of the second scientist/biologist participating in the tow. (Optional)
var_scientist_3_name <- "scientist_3_name_example" # character | The full name of the third scientist/biologist participating in the tow. (Optional)
var_scientist_4_name <- "scientist_4_name_example" # character | The full name of the fourth scientist/biologist participating in the tow. (Optional)
var_seafloor_area_swept_ha <- "seafloor_area_swept_ha_example" # character | Estimated two-dimensional seafloor area swept during the tow. This metric serves as the denominator for CPUE for species caught (weight (kg) / area swepth). This metric is derived using the following calcultion: derived net wing spread (m) X estimated distance fished (m) / 10000 = hectares swept. (Optional)
var_seafloor_area_swept_km2 <- "seafloor_area_swept_km2_example" # character | Estimated two-dimensional seafloor area swept during the tow. This metric serves as the denominator for CPUE for species caught (weight (kg) / area swepth). This metric is derived using the following calcultion: derived net wing spread (m) X estimated distance fished (m) / 1000000 = km2 swept. (Optional)
var_started_haulback_at <- "started_haulback_at_example" # character | when winches are started and haulback of the net begins. \"Sampling\" / \"fishing\" for the tow may continue, as the footrope is likely to stay in contact with the bottom for a period of time after haulback begins. UTC Date and time with timezone offset following in ISO 8601 (`YYYY-MM-DD HH:MM:SS+00`). Timestamp is to seconds precision (no fractional seconds). (Optional)
var_started_haulback_gear_latitude_dd <- "started_haulback_gear_latitude_dd_example" # character | Latitude of the gear/net when winches are started and haulback of the net begins. Latitude presented as decimal degrees with up to eight points of precision. (Optional)
var_started_haulback_gear_longitude_dd <- "started_haulback_gear_longitude_dd_example" # character | Longitude of the gear/net when winches are started and haulback of the net begins. Longitude presented as decimal degrees with up to eight points of precision. (Optional)
var_started_haulback_vessel_latitude_dd <- "started_haulback_vessel_latitude_dd_example" # character | Latitude of the vessel when winches are started and haulback of the net begins. Latitude presented as decimal degrees with up to eight points of precision. (Optional)
var_started_haulback_vessel_longitude_dd <- "started_haulback_vessel_longitude_dd_example" # character | Longitude of the vessel when winches are started and haulback of the net begins. Longitude presented as decimal degrees with up to eight points of precision. (Optional)
var_survey_year <- "survey_year_example" # character | Calendar year in integer format YYYY during which data was collected. (Optional)
var_swell_direction_code <- "swell_direction_code_example" # character | Direction of swell during operation. (Optional)
var_swell_height_ft <- "swell_height_ft_example" # character | Height of swell in feet. (Optional)
var_target_station_code <- "target_station_code_example" # character | Unique identifier for the sampling site visited. For the West Coast Groundfish Bottom Trawl Shelf/Slope Survey, sites follow a gridded pattern. Site codes incrementing sequentially by one from North to South and West to East, with the site furthest to the North starting at 4039 and the site furthest to the south ending at 23399. Most site codes are integers, but present as text data types to accommodate historical formats which included alphanumeric values. Historical site splits are represented by floating point numbers (site 44444 split to 44444.1 and 44444.2). The \"target\" sampling site designation indicates that the site was the target for sampling for the particular operation. The \"target\" sampling site designation indicates that the site was the target for sampling for the particular operation. The \"target\" site may diverge from the \"best\" in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to the \"best\" preferred geolocated site. (Optional)
var_total_catch_weight_kg <- "total_catch_weight_kg_example" # character | The aggregate total weight of the catch for the tow, measured in kg. (Optional)
var_tow_performance_name <- "tow_performance_name_example" # character | Descriptive name of the tow performance status. (Optional)
var_tow_sea_surface_fluorescence_mg_per_m3 <- "tow_sea_surface_fluorescence_mg_per_m3_example" # character | water fluorescence measured in ml/m3 (dbar). (Optional)
var_tow_sea_surface_water_temperature_c <- "tow_sea_surface_water_temperature_c_example" # character | Mean water temperature recorded at the sea surface during the extent of the tow. Temperature is typically recorded  In recent years this metric is typically collected via a hull-mounted Seabird Scientific SBE39plus temperature recorder,  with real-time data streamed via serial protocol into the wheelhouse for an average calculation. (Optional)
var_tow_sequence_number <- "tow_sequence_number_example" # character | Sequential number incrementing by one for each tow from the same vessel by year. (Optional)
var_tow_started_at <- "tow_started_at_example" # character | when the tow was first initiated and gear was deployed. UTC Date and time with timezone offset following in ISO 8601 (`YYYY-MM-DD HH:MM:SS+00`). Timestamp is to seconds precision (no fractional seconds). (Optional)
var_tow_started_vessel_latitude_dd <- "tow_started_vessel_latitude_dd_example" # character | Latitude of the vessel when the tow was first initiated and gear was deployed. Latitude presented as decimal degrees with up to eight points of precision. (Optional)
var_tow_started_vessel_longitude_dd <- "tow_started_vessel_longitude_dd_example" # character | Longitude of the vessel when the tow was first initiated and gear was deployed. Longitude presented as decimal degrees with up to eight points of precision. (Optional)
var_vertebrate_catch_weight_kg <- "vertebrate_catch_weight_kg_example" # character | The aggregate total weight of all vertebrates caught on tow, measured in kg. (Optional)
var_vessel_name <- "vessel_name_example" # character | Full capitalized name of the commercial or research vessel used to collect the data at sea.  As a general rule, names do not include the preceiding ship   or vessel prefix (i.e. Last Straw, NOT F/V Last Straw). (Optional)
var_was_actual_station_active_when_sampled <- "was_actual_station_active_when_sampled_example" # character | Boolean indicating if the actual station was active at the time it was sampled. The \"best\" sampling site designation indicates that the single summarized tow/haul location falls within this site boundary. The \"target\" site may diverge from the \"best\" in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to this preferred geolocated site. (Optional)
var_was_target_station_active_when_sampled <- "was_target_station_active_when_sampled_example" # character | Boolean indicating if the target station was active at the time of sampling. The \"target\" sampling site designation indicates that the site was the target for sampling for the particular operation. The \"target\" site may diverge from the \"best\" in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to the \"best\" preferred geolocated site. (Optional)
var_wave_direction_code <- "wave_direction_code_example" # character | Direction of waves during operation. (Optional)
var_wave_height_ft <- "wave_height_ft_example" # character | Height of waves in feet. (Optional)

api_instance <- DefaultApi$new()
# to save the result into a file, simply add the optional `data_file` parameter, e.g.
# result <- api_instance$GetBottomTrawlTows(limit = var_limit, fields = var_fields, offset = var_offset, redirect = var_redirect, data_format = var_data_format, response_mode = var_response_mode, include_noncore_fields = var_include_noncore_fields, actual_station_centroid_key = var_actual_station_centroid_key, actual_station_code = var_actual_station_code, actual_station_current_deactivation_reasons = var_actual_station_current_deactivation_reasons, actual_station_deactivation_year = var_actual_station_deactivation_year, actual_station_depth_stratum_name = var_actual_station_depth_stratum_name, actual_station_latitude_stratum_name = var_actual_station_latitude_stratum_name, best_tow_latitude_dd = var_best_tow_latitude_dd, best_tow_location_calculation_method_name = var_best_tow_location_calculation_method_name, best_tow_longitude_dd = var_best_tow_longitude_dd, bottom_trawl_operation_key = var_bottom_trawl_operation_key, captain_name = var_captain_name, data_readiness_level_code = var_data_readiness_level_code, data_readiness_level_display_name = var_data_readiness_level_display_name, data_status_name = var_data_status_name, direction_to_current_name = var_direction_to_current_name, doors_out_at = var_doors_out_at, doors_out_vessel_latitude_dd = var_doors_out_vessel_latitude_dd, doors_out_vessel_longitude_dd = var_doors_out_vessel_longitude_dd, doors_set_at = var_doors_set_at, doors_set_vessel_latitude_dd = var_doors_set_vessel_latitude_dd, doors_set_vessel_longitude_dd = var_doors_set_vessel_longitude_dd, doors_up_at = var_doors_up_at, doors_up_vessel_latitude_dd = var_doors_up_vessel_latitude_dd, doors_up_vessel_longitude_dd = var_doors_up_vessel_longitude_dd, field_party_chief_name = var_field_party_chief_name, invertebrate_catch_weight_kg = var_invertebrate_catch_weight_kg, is_actual_station_currently_active = var_is_actual_station_currently_active, is_tow_performance_satisfactory = var_is_tow_performance_satisfactory, leg_number = var_leg_number, net_off_bottom_at = var_net_off_bottom_at, net_off_bottom_gear_latitude_dd = var_net_off_bottom_gear_latitude_dd, net_off_bottom_gear_longitude_dd = var_net_off_bottom_gear_longitude_dd, net_off_bottom_vessel_latitude_dd = var_net_off_bottom_vessel_latitude_dd, net_off_bottom_vessel_longitude_dd = var_net_off_bottom_vessel_longitude_dd, net_on_bottom_at = var_net_on_bottom_at, net_on_bottom_gear_latitude_dd = var_net_on_bottom_gear_latitude_dd, net_on_bottom_gear_longitude_dd = var_net_on_bottom_gear_longitude_dd, net_on_bottom_vessel_latitude_dd = var_net_on_bottom_vessel_latitude_dd, net_on_bottom_vessel_longitude_dd = var_net_on_bottom_vessel_longitude_dd, nmfs_project_name = var_nmfs_project_name, nonspecific_organics_catch_weight_kg = var_nonspecific_organics_catch_weight_kg, on_bottom_dissolved_oxygen_ml_per_l = var_on_bottom_dissolved_oxygen_ml_per_l, on_bottom_distance_fished_m = var_on_bottom_distance_fished_m, on_bottom_elapsed_time_s = var_on_bottom_elapsed_time_s, on_bottom_net_door_spread_m = var_on_bottom_net_door_spread_m, on_bottom_net_headrope_depth_m = var_on_bottom_net_headrope_depth_m, on_bottom_net_headrope_height_m = var_on_bottom_net_headrope_height_m, on_bottom_net_wing_spread_m = var_on_bottom_net_wing_spread_m, on_bottom_salinity_psu = var_on_bottom_salinity_psu, on_bottom_seafloor_depth_calculation_method_name = var_on_bottom_seafloor_depth_calculation_method_name, on_bottom_seafloor_depth_m = var_on_bottom_seafloor_depth_m, on_bottom_water_conductivity_ml_per_m3 = var_on_bottom_water_conductivity_ml_per_m3, on_bottom_water_density_kg_per_m3 = var_on_bottom_water_density_kg_per_m3, on_bottom_water_pressure_dbar = var_on_bottom_water_pressure_dbar, on_bottom_water_temperature_c = var_on_bottom_water_temperature_c, on_bottom_water_turbidity_ntu = var_on_bottom_water_turbidity_ntu, pass_number = var_pass_number, sampling_date = var_sampling_date, scientist_1_name = var_scientist_1_name, scientist_2_name = var_scientist_2_name, scientist_3_name = var_scientist_3_name, scientist_4_name = var_scientist_4_name, seafloor_area_swept_ha = var_seafloor_area_swept_ha, seafloor_area_swept_km2 = var_seafloor_area_swept_km2, started_haulback_at = var_started_haulback_at, started_haulback_gear_latitude_dd = var_started_haulback_gear_latitude_dd, started_haulback_gear_longitude_dd = var_started_haulback_gear_longitude_dd, started_haulback_vessel_latitude_dd = var_started_haulback_vessel_latitude_dd, started_haulback_vessel_longitude_dd = var_started_haulback_vessel_longitude_dd, survey_year = var_survey_year, swell_direction_code = var_swell_direction_code, swell_height_ft = var_swell_height_ft, target_station_code = var_target_station_code, total_catch_weight_kg = var_total_catch_weight_kg, tow_performance_name = var_tow_performance_name, tow_sea_surface_fluorescence_mg_per_m3 = var_tow_sea_surface_fluorescence_mg_per_m3, tow_sea_surface_water_temperature_c = var_tow_sea_surface_water_temperature_c, tow_sequence_number = var_tow_sequence_number, tow_started_at = var_tow_started_at, tow_started_vessel_latitude_dd = var_tow_started_vessel_latitude_dd, tow_started_vessel_longitude_dd = var_tow_started_vessel_longitude_dd, vertebrate_catch_weight_kg = var_vertebrate_catch_weight_kg, vessel_name = var_vessel_name, was_actual_station_active_when_sampled = var_was_actual_station_active_when_sampled, was_target_station_active_when_sampled = var_was_target_station_active_when_sampled, wave_direction_code = var_wave_direction_code, wave_height_ft = var_wave_height_ftdata_file = "result.txt")
result <- api_instance$GetBottomTrawlTows(limit = var_limit, fields = var_fields, offset = var_offset, redirect = var_redirect, data_format = var_data_format, response_mode = var_response_mode, include_noncore_fields = var_include_noncore_fields, actual_station_centroid_key = var_actual_station_centroid_key, actual_station_code = var_actual_station_code, actual_station_current_deactivation_reasons = var_actual_station_current_deactivation_reasons, actual_station_deactivation_year = var_actual_station_deactivation_year, actual_station_depth_stratum_name = var_actual_station_depth_stratum_name, actual_station_latitude_stratum_name = var_actual_station_latitude_stratum_name, best_tow_latitude_dd = var_best_tow_latitude_dd, best_tow_location_calculation_method_name = var_best_tow_location_calculation_method_name, best_tow_longitude_dd = var_best_tow_longitude_dd, bottom_trawl_operation_key = var_bottom_trawl_operation_key, captain_name = var_captain_name, data_readiness_level_code = var_data_readiness_level_code, data_readiness_level_display_name = var_data_readiness_level_display_name, data_status_name = var_data_status_name, direction_to_current_name = var_direction_to_current_name, doors_out_at = var_doors_out_at, doors_out_vessel_latitude_dd = var_doors_out_vessel_latitude_dd, doors_out_vessel_longitude_dd = var_doors_out_vessel_longitude_dd, doors_set_at = var_doors_set_at, doors_set_vessel_latitude_dd = var_doors_set_vessel_latitude_dd, doors_set_vessel_longitude_dd = var_doors_set_vessel_longitude_dd, doors_up_at = var_doors_up_at, doors_up_vessel_latitude_dd = var_doors_up_vessel_latitude_dd, doors_up_vessel_longitude_dd = var_doors_up_vessel_longitude_dd, field_party_chief_name = var_field_party_chief_name, invertebrate_catch_weight_kg = var_invertebrate_catch_weight_kg, is_actual_station_currently_active = var_is_actual_station_currently_active, is_tow_performance_satisfactory = var_is_tow_performance_satisfactory, leg_number = var_leg_number, net_off_bottom_at = var_net_off_bottom_at, net_off_bottom_gear_latitude_dd = var_net_off_bottom_gear_latitude_dd, net_off_bottom_gear_longitude_dd = var_net_off_bottom_gear_longitude_dd, net_off_bottom_vessel_latitude_dd = var_net_off_bottom_vessel_latitude_dd, net_off_bottom_vessel_longitude_dd = var_net_off_bottom_vessel_longitude_dd, net_on_bottom_at = var_net_on_bottom_at, net_on_bottom_gear_latitude_dd = var_net_on_bottom_gear_latitude_dd, net_on_bottom_gear_longitude_dd = var_net_on_bottom_gear_longitude_dd, net_on_bottom_vessel_latitude_dd = var_net_on_bottom_vessel_latitude_dd, net_on_bottom_vessel_longitude_dd = var_net_on_bottom_vessel_longitude_dd, nmfs_project_name = var_nmfs_project_name, nonspecific_organics_catch_weight_kg = var_nonspecific_organics_catch_weight_kg, on_bottom_dissolved_oxygen_ml_per_l = var_on_bottom_dissolved_oxygen_ml_per_l, on_bottom_distance_fished_m = var_on_bottom_distance_fished_m, on_bottom_elapsed_time_s = var_on_bottom_elapsed_time_s, on_bottom_net_door_spread_m = var_on_bottom_net_door_spread_m, on_bottom_net_headrope_depth_m = var_on_bottom_net_headrope_depth_m, on_bottom_net_headrope_height_m = var_on_bottom_net_headrope_height_m, on_bottom_net_wing_spread_m = var_on_bottom_net_wing_spread_m, on_bottom_salinity_psu = var_on_bottom_salinity_psu, on_bottom_seafloor_depth_calculation_method_name = var_on_bottom_seafloor_depth_calculation_method_name, on_bottom_seafloor_depth_m = var_on_bottom_seafloor_depth_m, on_bottom_water_conductivity_ml_per_m3 = var_on_bottom_water_conductivity_ml_per_m3, on_bottom_water_density_kg_per_m3 = var_on_bottom_water_density_kg_per_m3, on_bottom_water_pressure_dbar = var_on_bottom_water_pressure_dbar, on_bottom_water_temperature_c = var_on_bottom_water_temperature_c, on_bottom_water_turbidity_ntu = var_on_bottom_water_turbidity_ntu, pass_number = var_pass_number, sampling_date = var_sampling_date, scientist_1_name = var_scientist_1_name, scientist_2_name = var_scientist_2_name, scientist_3_name = var_scientist_3_name, scientist_4_name = var_scientist_4_name, seafloor_area_swept_ha = var_seafloor_area_swept_ha, seafloor_area_swept_km2 = var_seafloor_area_swept_km2, started_haulback_at = var_started_haulback_at, started_haulback_gear_latitude_dd = var_started_haulback_gear_latitude_dd, started_haulback_gear_longitude_dd = var_started_haulback_gear_longitude_dd, started_haulback_vessel_latitude_dd = var_started_haulback_vessel_latitude_dd, started_haulback_vessel_longitude_dd = var_started_haulback_vessel_longitude_dd, survey_year = var_survey_year, swell_direction_code = var_swell_direction_code, swell_height_ft = var_swell_height_ft, target_station_code = var_target_station_code, total_catch_weight_kg = var_total_catch_weight_kg, tow_performance_name = var_tow_performance_name, tow_sea_surface_fluorescence_mg_per_m3 = var_tow_sea_surface_fluorescence_mg_per_m3, tow_sea_surface_water_temperature_c = var_tow_sea_surface_water_temperature_c, tow_sequence_number = var_tow_sequence_number, tow_started_at = var_tow_started_at, tow_started_vessel_latitude_dd = var_tow_started_vessel_latitude_dd, tow_started_vessel_longitude_dd = var_tow_started_vessel_longitude_dd, vertebrate_catch_weight_kg = var_vertebrate_catch_weight_kg, vessel_name = var_vessel_name, was_actual_station_active_when_sampled = var_was_actual_station_active_when_sampled, was_target_station_active_when_sampled = var_was_target_station_active_when_sampled, wave_direction_code = var_wave_direction_code, wave_height_ft = var_wave_height_ft)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **integer**| Max rows to return | [optional] 
 **fields** | list( **character** )| Comma-separated column filter | [optional] 
 **offset** | **integer**| Rows to skip before beginning to return records. | [optional] 
 **redirect** | **character**| Force S3 pre-signed redirect | [optional] 
 **data_format** | **character**| Response format: json, csv, or parquet | [optional] 
 **response_mode** | **character**| Delivery mode: data, package | [optional] 
 **include_noncore_fields** | **character**| All fields returned when true, else only core fields returned. | [optional] 
 **actual_station_centroid_key** | [**character**](.md)| A composite spatial key that uniquely identifies the centroid of a WCGBTS (West Coast Groundfish Bottom Trawl Survey) sampling station grid cell.     This key is a fixed 8-character string constructed by converting decimal degree coordinates into Degrees and Decimal Minutes (DDM), stripping away negative signs and truncating specific digits to create a consistent spatial identifier.    ### Component Breakdown  The 8-character format strictly follows the pattern **&#x60;[Lat Degrees][Lat Minutes][Lon Degrees][Lon Minutes]&#x60;**:    * **Latitude Degrees (2 characters):** The whole number of the decimal latitude (e.g., &#x60;43.58&#x60; becomes &#x60;43&#x60;).  * **Latitude Minutes (2 characters):** The decimal remainder of the latitude multiplied by 60 and rounded to the nearest whole number (e.g., &#x60;0.58139 * 60 &#x3D; 34.88&#x60;, which rounds to &#x60;35&#x60;).  * **Longitude Degrees (2 characters):** The whole number of the longitude, ignoring the negative sign (West) and dropping the leading hundreds place (e.g., &#x60;-124.61&#x60; becomes &#x60;24&#x60;).  * **Longitude Minutes (2 characters):** The decimal remainder of the longitude multiplied by 60 and rounded to the nearest whole number (e.g., &#x60;0.61465 * 60 &#x3D; 36.87&#x60;, which rounds to &#x60;37&#x60;).    &gt; **Example:** A grid cell centroid located at decimal coordinates **&#x60;43.58139678, -124.61465068&#x60;** results in the centroid key **&#x60;43352437&#x60;**. | [optional] 
 **actual_station_code** | [**character**](.md)| Unique identifier for the sampling site visited. For the West Coast Groundfish Bottom Trawl Shelf/Slope Survey, sites follow a gridded pattern. Site codes incrementing sequentially by one from North to South and West to East, with the site furthest to the North starting at 4039 and the site furthest to the south ending at 23399. Most site codes are integers, but present as text data types to accommodate historical formats which included alphanumeric values. Historical site splits are represented by floating point numbers (site 44444 split to 44444.1 and 44444.2). The \&quot;best\&quot; sampling site designation indicates that the single summarized tow/haul location falls within this site boundary. The \&quot;target\&quot; site may diverge from the \&quot;best\&quot; in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to this preferred geolocated site. | [optional] 
 **actual_station_current_deactivation_reasons** | [**character**](.md)| Comma-separated list of current reasons that a station is listed as inactive.  Value should be null unless the station is currently inactive. | [optional] 
 **actual_station_deactivation_year** | [**character**](.md)| The year YYYY when the actual station sampled was last deactivated, if the site is currently inactive. The \&quot;best\&quot; sampling site designation indicates that the single summarized tow/haul location falls within this site boundary. The \&quot;target\&quot; site may diverge from the \&quot;best\&quot; in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to this preferred geolocated site. | [optional] 
 **actual_station_depth_stratum_name** | [**character**](.md)| Name of the depth stratum that the sampling site falls into. Sampling on the West Coast Groundfish Bottom Trawl Shelf/Slope Survey follows a randomly stratified design, with sampling sites falling into one of three depth strata: 30-100 fathoms, 100-300 fathoms, and 300-700 fathoms. The \&quot;best\&quot; sampling site designation indicates that the single summarized tow/haul location falls within this site boundary. The \&quot;target\&quot; site may diverge from the \&quot;best\&quot; in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to this preferred geolocated site. | [optional] 
 **actual_station_latitude_stratum_name** | [**character**](.md)| Name of the latitude stratum that the sampling site falls into. Sampling on the West Coast Groundfish Bottom Trawl Shelf/Slope Survey follows a randomly stratified design, with sampling sites falling into one of two latitude strata: North of Point Conception (&gt;34°30&#39;N) or South of Point Conception (&lt;34°30&#39;N). The \&quot;best\&quot; sampling site designation indicates that the single summarized tow/haul location falls within this site boundary. The \&quot;target\&quot; site may diverge from the \&quot;best\&quot; in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to this preferred geolocated site. | [optional] 
 **best_tow_latitude_dd** | [**character**](.md)| Latitude of the single point in space that best represents where the tow sampling took place. Latitude presented as decimal degrees with up to eight points of precision. | [optional] 
 **best_tow_location_calculation_method_name** | [**character**](.md)| Calculation method used to determine the single \&quot;best\&quot; location for a tow.  For Shelf/Slope tows, the preferred and primary method to date is to identify the  median latitude and median longitude values of the on-bottom estimated gear track, and combine to derive the best location.  Only in the absence of data  used to estimate the gear track is an alternative method typically used. | [optional] 
 **best_tow_longitude_dd** | [**character**](.md)| Longitude of the single point in space that best represents where the tow sampling took place. Longitude presented as decimal degrees with up to eight points of precision. | [optional] 
 **bottom_trawl_operation_key** | [**character**](.md)| A 12-character numeric unique identifier for a West Coast Groundfish Bottom Trawl sampling operation.     It is constructed by concatenating key operational attributes into a single string. For example, the operation key **&#x60;202203020001&#x60;** breaks down as follows:    * **Survey Year (Digits 1-4):** The 4-digit year (YYYY) of sampling (e.g., &#x60;2022&#x60;).  * **Operation Type (Digits 5-6):** The 2-digit code representing the survey operation type (e.g., &#x60;03&#x60;).  * **Vessel ID (Digits 7-9):** The 3-digit, zero-padded identifier for the participating vessel (e.g., &#x60;020&#x60;).  * **Operation Increment (Digits 10-12):** The 3-digit, zero-padded sequential operation increment (e.g., &#x60;001&#x60;). | [optional] 
 **captain_name** | [**character**](.md)| The captain or skipper in charge of operating the vessel during an operation&#39;s sampling. | [optional] 
 **data_readiness_level_code** | [**character**](.md)| The code representing the data readiness level (Data Readiness Index). Readiness levels classify data across a spectrum from raw field collection to fully validated, analysis-ready products, and can be applied at the most granular level possible (entire datasets or specific row subsets).    Values include:  * **&#x60;L0&#x60; (RAW):** Unaltered sensor or field output. Contains noise and errors. Intended for technical diagnostics and engineering review.  * **&#x60;L1&#x60; (PRELIMINARY):** Ingested and schema-validated. Technical QC complete; Scientific PI review pending. Intended for in-season pulse checks and preliminary trends.  * **&#x60;L2&#x60; (VERIFIED):** Finalized after Scientific PI Review and QA/QC audits. Intended for authoritative Stock Assessments and publication.  * **&#x60;L3&#x60; (HARMONIZED):** Integrated across multi-year programs or disparate surveys using standard taxonomies and units.  * **&#x60;L4&#x60; (DERIVED):** High-value analytic products, aggregations (e.g., CPUE indices), or model-based spatial grids. | [optional] 
 **data_readiness_level_display_name** | [**character**](.md)| The formatted display name representing the data readiness level, combining the level code and its status label.    Values include:  * **&#x60;L0 - RAW&#x60;:** Unaltered sensor or field output containing noise and errors.  * **&#x60;L1 - PRELIMINARY&#x60;:** Ingested and schema-validated, pending Scientific PI review.  * **&#x60;L2 - VERIFIED&#x60;:** Finalized after Scientific PI Review and QA/QC audits.  * **&#x60;L3 - HARMONIZED&#x60;:** Integrated across multi-year programs or disparate surveys.  * **&#x60;L4 - DERIVED&#x60;:** High-value analytic products, aggregations, or model-based spatial grids. | [optional] 
 **data_status_name** | [**character**](.md)| Name of the data point&#39;s current status with respect to its finalization/QC status.  Typically new data submitted directly from the field is flagged as \&quot;Under Review\&quot;,   until it is reviewed, where it is then marked as \&quot;Finalized\&quot;.  Unfinalized data may  be used for any purpose, but for fisheries stock assessment, using/filtering for  finalized data is best. | [optional] 
 **direction_to_current_name** | [**character**](.md)| Direction of the vessel relative to the current. | [optional] 
 **doors_out_at** | [**character**](.md)| when the trawl doors are fully out, wire is fully deployed, and winch is stopped. UTC Date and time with timezone offset following in ISO 8601 (&#x60;YYYY-MM-DD HH:MM:SS+00&#x60;). Timestamp is to seconds precision (no fractional seconds). | [optional] 
 **doors_out_vessel_latitude_dd** | [**character**](.md)| Latitude of the vessel when the trawl doors are fully out, wire is wire fully deployed, and winch is stopped. Latitude presented as decimal degrees with up to eight points of precision. | [optional] 
 **doors_out_vessel_longitude_dd** | [**character**](.md)| Longitude of the vessel when the trawl doors are fully out, wire is wire fully deployed, and winch is stopped. Longitude presented as decimal degrees with up to eight points of precision. | [optional] 
 **doors_set_at** | [**character**](.md)| when the trawl doors were set after gear was deployed. UTC Date and time with timezone offset following in ISO 8601 (&#x60;YYYY-MM-DD HH:MM:SS+00&#x60;). Timestamp is to seconds precision (no fractional seconds). | [optional] 
 **doors_set_vessel_latitude_dd** | [**character**](.md)| Latitude of the vessel when the trawl doors were set after gear was deployed. Latitude presented as decimal degrees with up to eight points of precision. | [optional] 
 **doors_set_vessel_longitude_dd** | [**character**](.md)| Longitude of the vessel when the trawl doors were set after gear was deployed. Longitude presented as decimal degrees with up to eight points of precision. | [optional] 
 **doors_up_at** | [**character**](.md)| when the trawl doors are first visible at the sea surface from the deck/wheelhouse. UTC Date and time with timezone offset following in ISO 8601 (&#x60;YYYY-MM-DD HH:MM:SS+00&#x60;). Timestamp is to seconds precision (no fractional seconds). | [optional] 
 **doors_up_vessel_latitude_dd** | [**character**](.md)| Latitude of the vessel when the trawl doors are first visible at the sea surface from the deck/wheelhouse. Latitude presented as decimal degrees with up to eight points of precision. | [optional] 
 **doors_up_vessel_longitude_dd** | [**character**](.md)| Longitude of the vessel when the trawl doors are first visible at the sea surface from the deck/wheelhouse. Longitude presented as decimal degrees with up to eight points of precision. | [optional] 
 **field_party_chief_name** | [**character**](.md)| The operation&#39;s Field Party Chief abbreviated as FPC. The FPC leads all survey sampling and serves as the primary point of contact for data collection methods and operations while at sea. | [optional] 
 **invertebrate_catch_weight_kg** | [**character**](.md)| The aggregate total weight of all invertebrates caught on tow, measured in kg. | [optional] 
 **is_actual_station_currently_active** | [**character**](.md)| Boolean indicating if the actual station sampled is currently active. The \&quot;best\&quot; sampling site designation indicates that the single summarized tow/haul location falls within this site boundary. The \&quot;target\&quot; site may diverge from the \&quot;best\&quot; in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to this preferred geolocated site. | [optional] 
 **is_tow_performance_satisfactory** | [**character**](.md)| Flag indicating if the tow was performed according to protocols. | [optional] 
 **leg_number** | [**character**](.md)| Leg increment number when a sampling operation took place. Each vessel participating in the survey partakes in multiple legs (leg #1, #2...) as part of the survey schedule within a given pass, with each survey containing multiple passes per year. A vessel on the WCGBTS Shelf/Slope Survey typically is scheduled for 5 legs per year, although this is subject to change due to year-to-year schedule differences. | [optional] 
 **net_off_bottom_at** | [**character**](.md)| when the footrope loses contact with the bottom after haulback has begun, marking the end of \&quot;sampling\&quot; / \&quot;fishing\&quot; for the tow. UTC Date and time with timezone offset following in ISO 8601 (&#x60;YYYY-MM-DD HH:MM:SS+00&#x60;). Timestamp is to seconds precision (no fractional seconds). | [optional] 
 **net_off_bottom_gear_latitude_dd** | [**character**](.md)| Latitude of the gear/net when the footrope loses contact with the bottom after haulback has begun, marking the end of \&quot;sampling\&quot; / \&quot;fishing\&quot; for the tow. Latitude presented as decimal degrees with up to eight points of precision. | [optional] 
 **net_off_bottom_gear_longitude_dd** | [**character**](.md)| Longitude of the gear/net when the footrope loses contact with the bottom after haulback has begun, marking the end of \&quot;sampling\&quot; / \&quot;fishing\&quot; for the tow. Longitude presented as decimal degrees with up to eight points of precision. | [optional] 
 **net_off_bottom_vessel_latitude_dd** | [**character**](.md)| Latitude of the vessel when the footrope loses contact with the bottom after haulback has begun, marking the end of \&quot;sampling\&quot; / \&quot;fishing\&quot; for the tow. Latitude presented as decimal degrees with up to eight points of precision. | [optional] 
 **net_off_bottom_vessel_longitude_dd** | [**character**](.md)| Longitude of the vessel when the footrope loses contact with the bottom after haulback has begun, marking the end of \&quot;sampling\&quot; / \&quot;fishing\&quot; for the tow. Longitude presented as decimal degrees with up to eight points of precision. | [optional] 
 **net_on_bottom_at** | [**character**](.md)| when the footrope initially makes contact with the bottom, marking the start of \&quot;sampling\&quot; / \&quot;fishing\&quot; for the tow. UTC Date and time with timezone offset following in ISO 8601 (&#x60;YYYY-MM-DD HH:MM:SS+00&#x60;). Timestamp is to seconds precision (no fractional seconds). | [optional] 
 **net_on_bottom_gear_latitude_dd** | [**character**](.md)| Latitude of the gear/net when the footrope initially makes contact with the bottom, marking the start of \&quot;sampling\&quot; / \&quot;fishing\&quot; for the tow. Latitude presented as decimal degrees with up to eight points of precision. | [optional] 
 **net_on_bottom_gear_longitude_dd** | [**character**](.md)| Longitude of the gear/net when the footrope initially makes contact with the bottom, marking the start of \&quot;sampling\&quot; / \&quot;fishing\&quot; for the tow. Longitude presented as decimal degrees with up to eight points of precision. | [optional] 
 **net_on_bottom_vessel_latitude_dd** | [**character**](.md)| Latitude of the vessel when the footrope initially makes contact with the bottom, marking the start of \&quot;sampling\&quot; / \&quot;fishing\&quot; for the tow. Latitude presented as decimal degrees with up to eight points of precision. | [optional] 
 **net_on_bottom_vessel_longitude_dd** | [**character**](.md)| Longitude of the vessel when the footrope initially makes contact with the bottom, marking the start of \&quot;sampling\&quot; / \&quot;fishing\&quot; for the tow. Longitude presented as decimal degrees with up to eight points of precision. | [optional] 
 **nmfs_project_name** | [**character**](.md)| Name of the project/survey under the National Marine Fisheries Service (NMFS) for which the data was collected. | [optional] 
 **nonspecific_organics_catch_weight_kg** | [**character**](.md)| The aggregate total weight of nonspecific organic catch samples caught on tow, measured in kg. To date this category includes the following: gelatinous material unident., unsorted shab, decomposed fish, Echinoidea (crushed urchin), empty bivalve shells, empty gastropod shells, nonspecific egg-case unident. | [optional] 
 **on_bottom_dissolved_oxygen_ml_per_l** | [**character**](.md)| dissolved oxygen measured in ml/L. | [optional] 
 **on_bottom_distance_fished_m** | [**character**](.md)| Estimated distance in meters that the net was in contact with the bottom and fishing. This metric contributes directly to area swept and resulting CPUE (distance fished X derived net wing spread &#x3D; area swept). | [optional] 
 **on_bottom_elapsed_time_s** | [**character**](.md)| Total time the net was on the seafloor in seconds. | [optional] 
 **on_bottom_net_door_spread_m** | [**character**](.md)| the spread distance in meters of the trawl doors. While fishing on the WCGBTS Shelf/Slope survey this metric typically ranges from 30-50 meters, and may be used to predict corresponding wing spread for the tow if no wing spread is available. | [optional] 
 **on_bottom_net_headrope_depth_m** | [**character**](.md)| the depth in meters of the net&#39;s headrope from the sea surface. The sum of this metric and the headrope&#39;s height is often used to estimate total seafloor depth. | [optional] 
 **on_bottom_net_headrope_height_m** | [**character**](.md)| the distance in meters between the net&#39;s headrope and the seafloor. The sum of this metric and the headrope&#39;s depth is often used to estimate total seafloor depth. | [optional] 
 **on_bottom_net_wing_spread_m** | [**character**](.md)| the spread distance in meters of the trawl net wings. This value is typically used as the best proxy for the width of the area covered by the net while fishing. | [optional] 
 **on_bottom_salinity_psu** | [**character**](.md)| water salinity measured in practical salinity units (PSUs). | [optional] 
 **on_bottom_seafloor_depth_calculation_method_name** | [**character**](.md)| Name of the calculation method used to derive the best seafloor depth while the net was fishing on the bottom. | [optional] 
 **on_bottom_seafloor_depth_m** | [**character**](.md)| the depth of the seafloor to sea surface surface in meters. | [optional] 
 **on_bottom_water_conductivity_ml_per_m3** | [**character**](.md)| water conductivity. | [optional] 
 **on_bottom_water_density_kg_per_m3** | [**character**](.md)| water density measured in kg/m3. | [optional] 
 **on_bottom_water_pressure_dbar** | [**character**](.md)| water pressure measured in decibars (dbar). | [optional] 
 **on_bottom_water_temperature_c** | [**character**](.md)| seafloor water temperature measured in degrees Celsius. | [optional] 
 **on_bottom_water_turbidity_ntu** | [**character**](.md)| turbidity measured in Nephelometric Turbidity Units (NTUs). | [optional] 
 **pass_number** | [**character**](.md)| Pass increment number when a sampling operation took place (i.e. pass #1, #2...). Each annual survey typically has multiple passes, with each pass being assigned one or several vessels to participate in sampling. | [optional] 
 **sampling_date** | [**character**](.md)| Date when sampling took place, in YYYY-MM-DD ISO8601 format | [optional] 
 **scientist_1_name** | [**character**](.md)| The full name of the first scientist/biologist participating in the tow. | [optional] 
 **scientist_2_name** | [**character**](.md)| The full name of the second scientist/biologist participating in the tow. | [optional] 
 **scientist_3_name** | [**character**](.md)| The full name of the third scientist/biologist participating in the tow. | [optional] 
 **scientist_4_name** | [**character**](.md)| The full name of the fourth scientist/biologist participating in the tow. | [optional] 
 **seafloor_area_swept_ha** | [**character**](.md)| Estimated two-dimensional seafloor area swept during the tow. This metric serves as the denominator for CPUE for species caught (weight (kg) / area swepth). This metric is derived using the following calcultion: derived net wing spread (m) X estimated distance fished (m) / 10000 &#x3D; hectares swept. | [optional] 
 **seafloor_area_swept_km2** | [**character**](.md)| Estimated two-dimensional seafloor area swept during the tow. This metric serves as the denominator for CPUE for species caught (weight (kg) / area swepth). This metric is derived using the following calcultion: derived net wing spread (m) X estimated distance fished (m) / 1000000 &#x3D; km2 swept. | [optional] 
 **started_haulback_at** | [**character**](.md)| when winches are started and haulback of the net begins. \&quot;Sampling\&quot; / \&quot;fishing\&quot; for the tow may continue, as the footrope is likely to stay in contact with the bottom for a period of time after haulback begins. UTC Date and time with timezone offset following in ISO 8601 (&#x60;YYYY-MM-DD HH:MM:SS+00&#x60;). Timestamp is to seconds precision (no fractional seconds). | [optional] 
 **started_haulback_gear_latitude_dd** | [**character**](.md)| Latitude of the gear/net when winches are started and haulback of the net begins. Latitude presented as decimal degrees with up to eight points of precision. | [optional] 
 **started_haulback_gear_longitude_dd** | [**character**](.md)| Longitude of the gear/net when winches are started and haulback of the net begins. Longitude presented as decimal degrees with up to eight points of precision. | [optional] 
 **started_haulback_vessel_latitude_dd** | [**character**](.md)| Latitude of the vessel when winches are started and haulback of the net begins. Latitude presented as decimal degrees with up to eight points of precision. | [optional] 
 **started_haulback_vessel_longitude_dd** | [**character**](.md)| Longitude of the vessel when winches are started and haulback of the net begins. Longitude presented as decimal degrees with up to eight points of precision. | [optional] 
 **survey_year** | [**character**](.md)| Calendar year in integer format YYYY during which data was collected. | [optional] 
 **swell_direction_code** | [**character**](.md)| Direction of swell during operation. | [optional] 
 **swell_height_ft** | [**character**](.md)| Height of swell in feet. | [optional] 
 **target_station_code** | [**character**](.md)| Unique identifier for the sampling site visited. For the West Coast Groundfish Bottom Trawl Shelf/Slope Survey, sites follow a gridded pattern. Site codes incrementing sequentially by one from North to South and West to East, with the site furthest to the North starting at 4039 and the site furthest to the south ending at 23399. Most site codes are integers, but present as text data types to accommodate historical formats which included alphanumeric values. Historical site splits are represented by floating point numbers (site 44444 split to 44444.1 and 44444.2). The \&quot;target\&quot; sampling site designation indicates that the site was the target for sampling for the particular operation. The \&quot;target\&quot; sampling site designation indicates that the site was the target for sampling for the particular operation. The \&quot;target\&quot; site may diverge from the \&quot;best\&quot; in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to the \&quot;best\&quot; preferred geolocated site. | [optional] 
 **total_catch_weight_kg** | [**character**](.md)| The aggregate total weight of the catch for the tow, measured in kg. | [optional] 
 **tow_performance_name** | [**character**](.md)| Descriptive name of the tow performance status. | [optional] 
 **tow_sea_surface_fluorescence_mg_per_m3** | [**character**](.md)| water fluorescence measured in ml/m3 (dbar). | [optional] 
 **tow_sea_surface_water_temperature_c** | [**character**](.md)| Mean water temperature recorded at the sea surface during the extent of the tow. Temperature is typically recorded  In recent years this metric is typically collected via a hull-mounted Seabird Scientific SBE39plus temperature recorder,  with real-time data streamed via serial protocol into the wheelhouse for an average calculation. | [optional] 
 **tow_sequence_number** | [**character**](.md)| Sequential number incrementing by one for each tow from the same vessel by year. | [optional] 
 **tow_started_at** | [**character**](.md)| when the tow was first initiated and gear was deployed. UTC Date and time with timezone offset following in ISO 8601 (&#x60;YYYY-MM-DD HH:MM:SS+00&#x60;). Timestamp is to seconds precision (no fractional seconds). | [optional] 
 **tow_started_vessel_latitude_dd** | [**character**](.md)| Latitude of the vessel when the tow was first initiated and gear was deployed. Latitude presented as decimal degrees with up to eight points of precision. | [optional] 
 **tow_started_vessel_longitude_dd** | [**character**](.md)| Longitude of the vessel when the tow was first initiated and gear was deployed. Longitude presented as decimal degrees with up to eight points of precision. | [optional] 
 **vertebrate_catch_weight_kg** | [**character**](.md)| The aggregate total weight of all vertebrates caught on tow, measured in kg. | [optional] 
 **vessel_name** | [**character**](.md)| Full capitalized name of the commercial or research vessel used to collect the data at sea.  As a general rule, names do not include the preceiding ship   or vessel prefix (i.e. Last Straw, NOT F/V Last Straw). | [optional] 
 **was_actual_station_active_when_sampled** | [**character**](.md)| Boolean indicating if the actual station was active at the time it was sampled. The \&quot;best\&quot; sampling site designation indicates that the single summarized tow/haul location falls within this site boundary. The \&quot;target\&quot; site may diverge from the \&quot;best\&quot; in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to this preferred geolocated site. | [optional] 
 **was_target_station_active_when_sampled** | [**character**](.md)| Boolean indicating if the target station was active at the time of sampling. The \&quot;target\&quot; sampling site designation indicates that the site was the target for sampling for the particular operation. The \&quot;target\&quot; site may diverge from the \&quot;best\&quot; in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to the \&quot;best\&quot; preferred geolocated site. | [optional] 
 **wave_direction_code** | [**character**](.md)| Direction of waves during operation. | [optional] 
 **wave_height_ft** | [**character**](.md)| Height of waves in feet. | [optional] 

### Return type

[**array[BottomTrawlTows]**](bottom_trawl_tows.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/csv, application/zip, application/vnd.apache.parquet

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Success |  -  |
| **302** | Redirect to S3 for large sets or alternative formats |  * Location - The pre-signed S3 URL <br>  |

# **GetHookAndLineHookAndLineCommonNames**
> array[HookAndLineHookAndLineCommonNames] GetHookAndLineHookAndLineCommonNames(limit = var.limit, fields = var.fields, offset = var.offset, redirect = var.redirect, data_format = var.data_format, response_mode = var.response_mode, include_noncore_fields = var.include_noncore_fields, label = var.label, survey_years = var.survey_years, value = var.value, vessels = var.vessels)

hook_and_line_common_names

A distinct list of all historical common names caught on Southern California Hook & Line surveys.

### Example
```R
library(nwfscDataCatalog)

# hook_and_line_common_names
#
# prepare function argument(s)
var_limit <- 56 # integer | Max rows to return (Optional)
var_fields <- c("inner_example") # array[character] | Comma-separated column filter (Optional)
var_offset <- 56 # integer | Rows to skip before beginning to return records. (Optional)
var_redirect <- "redirect_example" # character | Force S3 pre-signed redirect (Optional)
var_data_format <- "data_format_example" # character | Response format: json, csv, or parquet (Optional)
var_response_mode <- "response_mode_example" # character | Delivery mode: data, package (Optional)
var_include_noncore_fields <- "include_noncore_fields_example" # character | All fields returned when true, else only core fields returned. (Optional)
var_label <- "label_example" # character | Filter by label (Optional)
var_survey_years <- "survey_years_example" # character | Filter by survey_years (Optional)
var_value <- "value_example" # character | Filter by value (Optional)
var_vessels <- "vessels_example" # character | Filter by vessels (Optional)

api_instance <- DefaultApi$new()
# to save the result into a file, simply add the optional `data_file` parameter, e.g.
# result <- api_instance$GetHookAndLineHookAndLineCommonNames(limit = var_limit, fields = var_fields, offset = var_offset, redirect = var_redirect, data_format = var_data_format, response_mode = var_response_mode, include_noncore_fields = var_include_noncore_fields, label = var_label, survey_years = var_survey_years, value = var_value, vessels = var_vesselsdata_file = "result.txt")
result <- api_instance$GetHookAndLineHookAndLineCommonNames(limit = var_limit, fields = var_fields, offset = var_offset, redirect = var_redirect, data_format = var_data_format, response_mode = var_response_mode, include_noncore_fields = var_include_noncore_fields, label = var_label, survey_years = var_survey_years, value = var_value, vessels = var_vessels)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **integer**| Max rows to return | [optional] 
 **fields** | list( **character** )| Comma-separated column filter | [optional] 
 **offset** | **integer**| Rows to skip before beginning to return records. | [optional] 
 **redirect** | **character**| Force S3 pre-signed redirect | [optional] 
 **data_format** | **character**| Response format: json, csv, or parquet | [optional] 
 **response_mode** | **character**| Delivery mode: data, package | [optional] 
 **include_noncore_fields** | **character**| All fields returned when true, else only core fields returned. | [optional] 
 **label** | [**character**](.md)| Filter by label | [optional] 
 **survey_years** | [**character**](.md)| Filter by survey_years | [optional] 
 **value** | [**character**](.md)| Filter by value | [optional] 
 **vessels** | [**character**](.md)| Filter by vessels | [optional] 

### Return type

[**array[HookAndLineHookAndLineCommonNames]**](hook_and_line_hook_and_line_common_names.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/csv, application/zip, application/vnd.apache.parquet

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Success |  -  |
| **302** | Redirect to S3 for large sets or alternative formats |  * Location - The pre-signed S3 URL <br>  |

# **GetHookAndLineHookAndLineVessels**
> array[HookAndLineHookAndLineVessels] GetHookAndLineHookAndLineVessels(limit = var.limit, fields = var.fields, offset = var.offset, redirect = var.redirect, data_format = var.data_format, response_mode = var.response_mode, include_noncore_fields = var.include_noncore_fields, label = var.label, survey_years = var.survey_years, value = var.value)

hook_and_line_vessels

A distinct list of all vessels that participated in the Southern California Hook & Line survey.

### Example
```R
library(nwfscDataCatalog)

# hook_and_line_vessels
#
# prepare function argument(s)
var_limit <- 56 # integer | Max rows to return (Optional)
var_fields <- c("inner_example") # array[character] | Comma-separated column filter (Optional)
var_offset <- 56 # integer | Rows to skip before beginning to return records. (Optional)
var_redirect <- "redirect_example" # character | Force S3 pre-signed redirect (Optional)
var_data_format <- "data_format_example" # character | Response format: json, csv, or parquet (Optional)
var_response_mode <- "response_mode_example" # character | Delivery mode: data, package (Optional)
var_include_noncore_fields <- "include_noncore_fields_example" # character | All fields returned when true, else only core fields returned. (Optional)
var_label <- "label_example" # character | Filter by label (Optional)
var_survey_years <- "survey_years_example" # character | Filter by survey_years (Optional)
var_value <- "value_example" # character | Filter by value (Optional)

api_instance <- DefaultApi$new()
# to save the result into a file, simply add the optional `data_file` parameter, e.g.
# result <- api_instance$GetHookAndLineHookAndLineVessels(limit = var_limit, fields = var_fields, offset = var_offset, redirect = var_redirect, data_format = var_data_format, response_mode = var_response_mode, include_noncore_fields = var_include_noncore_fields, label = var_label, survey_years = var_survey_years, value = var_valuedata_file = "result.txt")
result <- api_instance$GetHookAndLineHookAndLineVessels(limit = var_limit, fields = var_fields, offset = var_offset, redirect = var_redirect, data_format = var_data_format, response_mode = var_response_mode, include_noncore_fields = var_include_noncore_fields, label = var_label, survey_years = var_survey_years, value = var_value)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **integer**| Max rows to return | [optional] 
 **fields** | list( **character** )| Comma-separated column filter | [optional] 
 **offset** | **integer**| Rows to skip before beginning to return records. | [optional] 
 **redirect** | **character**| Force S3 pre-signed redirect | [optional] 
 **data_format** | **character**| Response format: json, csv, or parquet | [optional] 
 **response_mode** | **character**| Delivery mode: data, package | [optional] 
 **include_noncore_fields** | **character**| All fields returned when true, else only core fields returned. | [optional] 
 **label** | [**character**](.md)| Filter by label | [optional] 
 **survey_years** | [**character**](.md)| Filter by survey_years | [optional] 
 **value** | [**character**](.md)| Filter by value | [optional] 

### Return type

[**array[HookAndLineHookAndLineVessels]**](hook_and_line_hook_and_line_vessels.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/csv, application/zip, application/vnd.apache.parquet

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Success |  -  |
| **302** | Redirect to S3 for large sets or alternative formats |  * Location - The pre-signed S3 URL <br>  |

# **GetNwfscAllSurveyYears**
> array[NwfscAllSurveyYears] GetNwfscAllSurveyYears(limit = var.limit, fields = var.fields, offset = var.offset, redirect = var.redirect, data_format = var.data_format, response_mode = var.response_mode, include_noncore_fields = var.include_noncore_fields, label = var.label, value = var.value)

all_survey_years

All survey years for all surveys

### Example
```R
library(nwfscDataCatalog)

# all_survey_years
#
# prepare function argument(s)
var_limit <- 56 # integer | Max rows to return (Optional)
var_fields <- c("inner_example") # array[character] | Comma-separated column filter (Optional)
var_offset <- 56 # integer | Rows to skip before beginning to return records. (Optional)
var_redirect <- "redirect_example" # character | Force S3 pre-signed redirect (Optional)
var_data_format <- "data_format_example" # character | Response format: json, csv, or parquet (Optional)
var_response_mode <- "response_mode_example" # character | Delivery mode: data, package (Optional)
var_include_noncore_fields <- "include_noncore_fields_example" # character | All fields returned when true, else only core fields returned. (Optional)
var_label <- "label_example" # character | Filter by label (Optional)
var_value <- "value_example" # character | Filter by value (Optional)

api_instance <- DefaultApi$new()
# to save the result into a file, simply add the optional `data_file` parameter, e.g.
# result <- api_instance$GetNwfscAllSurveyYears(limit = var_limit, fields = var_fields, offset = var_offset, redirect = var_redirect, data_format = var_data_format, response_mode = var_response_mode, include_noncore_fields = var_include_noncore_fields, label = var_label, value = var_valuedata_file = "result.txt")
result <- api_instance$GetNwfscAllSurveyYears(limit = var_limit, fields = var_fields, offset = var_offset, redirect = var_redirect, data_format = var_data_format, response_mode = var_response_mode, include_noncore_fields = var_include_noncore_fields, label = var_label, value = var_value)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **integer**| Max rows to return | [optional] 
 **fields** | list( **character** )| Comma-separated column filter | [optional] 
 **offset** | **integer**| Rows to skip before beginning to return records. | [optional] 
 **redirect** | **character**| Force S3 pre-signed redirect | [optional] 
 **data_format** | **character**| Response format: json, csv, or parquet | [optional] 
 **response_mode** | **character**| Delivery mode: data, package | [optional] 
 **include_noncore_fields** | **character**| All fields returned when true, else only core fields returned. | [optional] 
 **label** | [**character**](.md)| Filter by label | [optional] 
 **value** | [**character**](.md)| Filter by value | [optional] 

### Return type

[**array[NwfscAllSurveyYears]**](nwfsc_all_survey_years.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/csv, application/zip, application/vnd.apache.parquet

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Success |  -  |
| **302** | Redirect to S3 for large sets or alternative formats |  * Location - The pre-signed S3 URL <br>  |

# **GetNwfscAllTaxonCategories**
> array[NwfscAllTaxonCategories] GetNwfscAllTaxonCategories(limit = var.limit, fields = var.fields, offset = var.offset, redirect = var.redirect, data_format = var.data_format, response_mode = var.response_mode, include_noncore_fields = var.include_noncore_fields, label = var.label, value = var.value)

all_taxon_categories

A distinct list of all species categories recognized by NWFSC in the taxonomy dataset.

### Example
```R
library(nwfscDataCatalog)

# all_taxon_categories
#
# prepare function argument(s)
var_limit <- 56 # integer | Max rows to return (Optional)
var_fields <- c("inner_example") # array[character] | Comma-separated column filter (Optional)
var_offset <- 56 # integer | Rows to skip before beginning to return records. (Optional)
var_redirect <- "redirect_example" # character | Force S3 pre-signed redirect (Optional)
var_data_format <- "data_format_example" # character | Response format: json, csv, or parquet (Optional)
var_response_mode <- "response_mode_example" # character | Delivery mode: data, package (Optional)
var_include_noncore_fields <- "include_noncore_fields_example" # character | All fields returned when true, else only core fields returned. (Optional)
var_label <- "label_example" # character | Filter by label (Optional)
var_value <- "value_example" # character | Filter by value (Optional)

api_instance <- DefaultApi$new()
# to save the result into a file, simply add the optional `data_file` parameter, e.g.
# result <- api_instance$GetNwfscAllTaxonCategories(limit = var_limit, fields = var_fields, offset = var_offset, redirect = var_redirect, data_format = var_data_format, response_mode = var_response_mode, include_noncore_fields = var_include_noncore_fields, label = var_label, value = var_valuedata_file = "result.txt")
result <- api_instance$GetNwfscAllTaxonCategories(limit = var_limit, fields = var_fields, offset = var_offset, redirect = var_redirect, data_format = var_data_format, response_mode = var_response_mode, include_noncore_fields = var_include_noncore_fields, label = var_label, value = var_value)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **integer**| Max rows to return | [optional] 
 **fields** | list( **character** )| Comma-separated column filter | [optional] 
 **offset** | **integer**| Rows to skip before beginning to return records. | [optional] 
 **redirect** | **character**| Force S3 pre-signed redirect | [optional] 
 **data_format** | **character**| Response format: json, csv, or parquet | [optional] 
 **response_mode** | **character**| Delivery mode: data, package | [optional] 
 **include_noncore_fields** | **character**| All fields returned when true, else only core fields returned. | [optional] 
 **label** | [**character**](.md)| Filter by label | [optional] 
 **value** | [**character**](.md)| Filter by value | [optional] 

### Return type

[**array[NwfscAllTaxonCategories]**](nwfsc_all_taxon_categories.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/csv, application/zip, application/vnd.apache.parquet

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Success |  -  |
| **302** | Redirect to S3 for large sets or alternative formats |  * Location - The pre-signed S3 URL <br>  |

# **GetNwfscAllTaxonSubcategories**
> array[NwfscAllTaxonSubcategories] GetNwfscAllTaxonSubcategories(limit = var.limit, fields = var.fields, offset = var.offset, redirect = var.redirect, data_format = var.data_format, response_mode = var.response_mode, include_noncore_fields = var.include_noncore_fields, label = var.label, taxon_category = var.taxon_category, value = var.value)

all_taxon_subcategories

A distinct list of all species subcategories recognized by NWFSC in the taxonomy dataset.

### Example
```R
library(nwfscDataCatalog)

# all_taxon_subcategories
#
# prepare function argument(s)
var_limit <- 56 # integer | Max rows to return (Optional)
var_fields <- c("inner_example") # array[character] | Comma-separated column filter (Optional)
var_offset <- 56 # integer | Rows to skip before beginning to return records. (Optional)
var_redirect <- "redirect_example" # character | Force S3 pre-signed redirect (Optional)
var_data_format <- "data_format_example" # character | Response format: json, csv, or parquet (Optional)
var_response_mode <- "response_mode_example" # character | Delivery mode: data, package (Optional)
var_include_noncore_fields <- "include_noncore_fields_example" # character | All fields returned when true, else only core fields returned. (Optional)
var_label <- "label_example" # character | Filter by label (Optional)
var_taxon_category <- "taxon_category_example" # character | Filter by taxon_category (Optional)
var_value <- "value_example" # character | Filter by value (Optional)

api_instance <- DefaultApi$new()
# to save the result into a file, simply add the optional `data_file` parameter, e.g.
# result <- api_instance$GetNwfscAllTaxonSubcategories(limit = var_limit, fields = var_fields, offset = var_offset, redirect = var_redirect, data_format = var_data_format, response_mode = var_response_mode, include_noncore_fields = var_include_noncore_fields, label = var_label, taxon_category = var_taxon_category, value = var_valuedata_file = "result.txt")
result <- api_instance$GetNwfscAllTaxonSubcategories(limit = var_limit, fields = var_fields, offset = var_offset, redirect = var_redirect, data_format = var_data_format, response_mode = var_response_mode, include_noncore_fields = var_include_noncore_fields, label = var_label, taxon_category = var_taxon_category, value = var_value)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **integer**| Max rows to return | [optional] 
 **fields** | list( **character** )| Comma-separated column filter | [optional] 
 **offset** | **integer**| Rows to skip before beginning to return records. | [optional] 
 **redirect** | **character**| Force S3 pre-signed redirect | [optional] 
 **data_format** | **character**| Response format: json, csv, or parquet | [optional] 
 **response_mode** | **character**| Delivery mode: data, package | [optional] 
 **include_noncore_fields** | **character**| All fields returned when true, else only core fields returned. | [optional] 
 **label** | [**character**](.md)| Filter by label | [optional] 
 **taxon_category** | [**character**](.md)| Filter by taxon_category | [optional] 
 **value** | [**character**](.md)| Filter by value | [optional] 

### Return type

[**array[NwfscAllTaxonSubcategories]**](nwfsc_all_taxon_subcategories.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/csv, application/zip, application/vnd.apache.parquet

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Success |  -  |
| **302** | Redirect to S3 for large sets or alternative formats |  * Location - The pre-signed S3 URL <br>  |

# **GetNwfscHookAndLineSurveyYears**
> array[NwfscHookAndLineSurveyYears] GetNwfscHookAndLineSurveyYears(limit = var.limit, fields = var.fields, offset = var.offset, redirect = var.redirect, data_format = var.data_format, response_mode = var.response_mode, include_noncore_fields = var.include_noncore_fields, label = var.label, value = var.value)

hook_and_line_survey_years

A distinct list of all survey years with hook and line survey data in the NWFSC database.

### Example
```R
library(nwfscDataCatalog)

# hook_and_line_survey_years
#
# prepare function argument(s)
var_limit <- 56 # integer | Max rows to return (Optional)
var_fields <- c("inner_example") # array[character] | Comma-separated column filter (Optional)
var_offset <- 56 # integer | Rows to skip before beginning to return records. (Optional)
var_redirect <- "redirect_example" # character | Force S3 pre-signed redirect (Optional)
var_data_format <- "data_format_example" # character | Response format: json, csv, or parquet (Optional)
var_response_mode <- "response_mode_example" # character | Delivery mode: data, package (Optional)
var_include_noncore_fields <- "include_noncore_fields_example" # character | All fields returned when true, else only core fields returned. (Optional)
var_label <- "label_example" # character | Filter by label (Optional)
var_value <- "value_example" # character | Filter by value (Optional)

api_instance <- DefaultApi$new()
# to save the result into a file, simply add the optional `data_file` parameter, e.g.
# result <- api_instance$GetNwfscHookAndLineSurveyYears(limit = var_limit, fields = var_fields, offset = var_offset, redirect = var_redirect, data_format = var_data_format, response_mode = var_response_mode, include_noncore_fields = var_include_noncore_fields, label = var_label, value = var_valuedata_file = "result.txt")
result <- api_instance$GetNwfscHookAndLineSurveyYears(limit = var_limit, fields = var_fields, offset = var_offset, redirect = var_redirect, data_format = var_data_format, response_mode = var_response_mode, include_noncore_fields = var_include_noncore_fields, label = var_label, value = var_value)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **integer**| Max rows to return | [optional] 
 **fields** | list( **character** )| Comma-separated column filter | [optional] 
 **offset** | **integer**| Rows to skip before beginning to return records. | [optional] 
 **redirect** | **character**| Force S3 pre-signed redirect | [optional] 
 **data_format** | **character**| Response format: json, csv, or parquet | [optional] 
 **response_mode** | **character**| Delivery mode: data, package | [optional] 
 **include_noncore_fields** | **character**| All fields returned when true, else only core fields returned. | [optional] 
 **label** | [**character**](.md)| Filter by label | [optional] 
 **value** | [**character**](.md)| Filter by value | [optional] 

### Return type

[**array[NwfscHookAndLineSurveyYears]**](nwfsc_hook_and_line_survey_years.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/csv, application/zip, application/vnd.apache.parquet

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Success |  -  |
| **302** | Redirect to S3 for large sets or alternative formats |  * Location - The pre-signed S3 URL <br>  |

# **GetNwfscSurveyTaxonomy**
> array[NwfscSurveyTaxonomy] GetNwfscSurveyTaxonomy(limit = var.limit, fields = var.fields, offset = var.offset, redirect = var.redirect, data_format = var.data_format, response_mode = var.response_mode, include_noncore_fields = var.include_noncore_fields, bottom_trawl_taxon_alias = var.bottom_trawl_taxon_alias, hierarchy_level_name = var.hierarchy_level_name, hook_and_line_taxon_alias = var.hook_and_line_taxon_alias, is_bird = var.is_bird, is_bony_fish = var.is_bony_fish, is_coral = var.is_coral, is_herring = var.is_herring, is_invertebrate = var.is_invertebrate, is_jawless_fish = var.is_jawless_fish, is_mammal = var.is_mammal, is_nonspecific_organic = var.is_nonspecific_organic, is_pacific_salmon = var.is_pacific_salmon, is_reptile = var.is_reptile, is_rockfish = var.is_rockfish, is_skate = var.is_skate, is_smelt = var.is_smelt, is_sponge = var.is_sponge, is_squid = var.is_squid, is_vertebrate = var.is_vertebrate, itis_tsn = var.itis_tsn, itis_website = var.itis_website, legacy_warehouse_source_taxon_key = var.legacy_warehouse_source_taxon_key, parent_scientific_name = var.parent_scientific_name, scientific_name = var.scientific_name, taxon_aliases = var.taxon_aliases, taxon_category = var.taxon_category, taxon_subcategory = var.taxon_subcategory, worms_aphia_id = var.worms_aphia_id, worms_website = var.worms_website)

NWFSC Survey Taxonomy

The full taxonomic hierarchy dataset used by at-sea data collection processes and shoreside reporting at NWFSC. The backbone of this report is its tie in to both WoRMS (https://www.marinespecies.org/) and ITIS (https://www.itis.gov/) linkages via worms_aphia_id and itis_tsn values.

### Example
```R
library(nwfscDataCatalog)

# NWFSC Survey Taxonomy
#
# prepare function argument(s)
var_limit <- 56 # integer | Max rows to return (Optional)
var_fields <- c("inner_example") # array[character] | Comma-separated column filter (Optional)
var_offset <- 56 # integer | Rows to skip before beginning to return records. (Optional)
var_redirect <- "redirect_example" # character | Force S3 pre-signed redirect (Optional)
var_data_format <- "data_format_example" # character | Response format: json, csv, or parquet (Optional)
var_response_mode <- "response_mode_example" # character | Delivery mode: data, package (Optional)
var_include_noncore_fields <- "include_noncore_fields_example" # character | All fields returned when true, else only core fields returned. (Optional)
var_bottom_trawl_taxon_alias <- "bottom_trawl_taxon_alias_example" # character | Bottom Trawl preferred alias (Optional)
var_hierarchy_level_name <- "hierarchy_level_name_example" # character | Taxonomic rank (e.g. Species, Genus) (Optional)
var_hook_and_line_taxon_alias <- "hook_and_line_taxon_alias_example" # character | Hook & Line preferred alias (Optional)
var_is_bird <- "is_bird_example" # character | Flag indicating if taxon is a bird (Optional)
var_is_bony_fish <- "is_bony_fish_example" # character | Flag indicating if taxon is a bony fish (Optional)
var_is_coral <- "is_coral_example" # character | Flag indicating if taxon is a coral (Optional)
var_is_herring <- "is_herring_example" # character | Flag indicating if taxon is a herring (Optional)
var_is_invertebrate <- "is_invertebrate_example" # character | Flag indicating if taxon is an invertebrate (Optional)
var_is_jawless_fish <- "is_jawless_fish_example" # character | Flag indicating if taxon is a jawless fish (Optional)
var_is_mammal <- "is_mammal_example" # character | Flag indicating if taxon is a mammal (Optional)
var_is_nonspecific_organic <- "is_nonspecific_organic_example" # character | Flag indicating if taxon is nonspecific organic (Optional)
var_is_pacific_salmon <- "is_pacific_salmon_example" # character | Flag indicating if taxon is a Pacific salmon (Optional)
var_is_reptile <- "is_reptile_example" # character | Flag indicating if taxon is a reptile (Optional)
var_is_rockfish <- "is_rockfish_example" # character | Flag indicating if taxon is a rockfish (Optional)
var_is_skate <- "is_skate_example" # character | Flag indicating if taxon is a skate (Optional)
var_is_smelt <- "is_smelt_example" # character | Flag indicating if taxon is a smelt (Optional)
var_is_sponge <- "is_sponge_example" # character | Flag indicating if taxon is a sponge (Optional)
var_is_squid <- "is_squid_example" # character | Flag indicating if taxon is a squid (Optional)
var_is_vertebrate <- "is_vertebrate_example" # character | Flag indicating if taxon is a vertebrate (Optional)
var_itis_tsn <- "itis_tsn_example" # character | ITIS Taxonomic Serial Number (Optional)
var_itis_website <- "itis_website_example" # character | Link to ITIS website (Optional)
var_legacy_warehouse_source_taxon_key <- "legacy_warehouse_source_taxon_key_example" # character | Source key for legacy warehouse (Optional)
var_parent_scientific_name <- "parent_scientific_name_example" # character | Scientific name of the parent taxon (Optional)
var_scientific_name <- "scientific_name_example" # character | Scientific name of the taxon (Optional)
var_taxon_aliases <- "taxon_aliases_example" # character | Array of aliases for the taxon (Optional)
var_taxon_category <- "taxon_category_example" # character | Broad category of the taxon (Optional)
var_taxon_subcategory <- "taxon_subcategory_example" # character | Subcategory of the taxon (Optional)
var_worms_aphia_id <- "worms_aphia_id_example" # character | WoRMS AphiaID (Optional)
var_worms_website <- "worms_website_example" # character | Link to WoRMS website (Optional)

api_instance <- DefaultApi$new()
# to save the result into a file, simply add the optional `data_file` parameter, e.g.
# result <- api_instance$GetNwfscSurveyTaxonomy(limit = var_limit, fields = var_fields, offset = var_offset, redirect = var_redirect, data_format = var_data_format, response_mode = var_response_mode, include_noncore_fields = var_include_noncore_fields, bottom_trawl_taxon_alias = var_bottom_trawl_taxon_alias, hierarchy_level_name = var_hierarchy_level_name, hook_and_line_taxon_alias = var_hook_and_line_taxon_alias, is_bird = var_is_bird, is_bony_fish = var_is_bony_fish, is_coral = var_is_coral, is_herring = var_is_herring, is_invertebrate = var_is_invertebrate, is_jawless_fish = var_is_jawless_fish, is_mammal = var_is_mammal, is_nonspecific_organic = var_is_nonspecific_organic, is_pacific_salmon = var_is_pacific_salmon, is_reptile = var_is_reptile, is_rockfish = var_is_rockfish, is_skate = var_is_skate, is_smelt = var_is_smelt, is_sponge = var_is_sponge, is_squid = var_is_squid, is_vertebrate = var_is_vertebrate, itis_tsn = var_itis_tsn, itis_website = var_itis_website, legacy_warehouse_source_taxon_key = var_legacy_warehouse_source_taxon_key, parent_scientific_name = var_parent_scientific_name, scientific_name = var_scientific_name, taxon_aliases = var_taxon_aliases, taxon_category = var_taxon_category, taxon_subcategory = var_taxon_subcategory, worms_aphia_id = var_worms_aphia_id, worms_website = var_worms_websitedata_file = "result.txt")
result <- api_instance$GetNwfscSurveyTaxonomy(limit = var_limit, fields = var_fields, offset = var_offset, redirect = var_redirect, data_format = var_data_format, response_mode = var_response_mode, include_noncore_fields = var_include_noncore_fields, bottom_trawl_taxon_alias = var_bottom_trawl_taxon_alias, hierarchy_level_name = var_hierarchy_level_name, hook_and_line_taxon_alias = var_hook_and_line_taxon_alias, is_bird = var_is_bird, is_bony_fish = var_is_bony_fish, is_coral = var_is_coral, is_herring = var_is_herring, is_invertebrate = var_is_invertebrate, is_jawless_fish = var_is_jawless_fish, is_mammal = var_is_mammal, is_nonspecific_organic = var_is_nonspecific_organic, is_pacific_salmon = var_is_pacific_salmon, is_reptile = var_is_reptile, is_rockfish = var_is_rockfish, is_skate = var_is_skate, is_smelt = var_is_smelt, is_sponge = var_is_sponge, is_squid = var_is_squid, is_vertebrate = var_is_vertebrate, itis_tsn = var_itis_tsn, itis_website = var_itis_website, legacy_warehouse_source_taxon_key = var_legacy_warehouse_source_taxon_key, parent_scientific_name = var_parent_scientific_name, scientific_name = var_scientific_name, taxon_aliases = var_taxon_aliases, taxon_category = var_taxon_category, taxon_subcategory = var_taxon_subcategory, worms_aphia_id = var_worms_aphia_id, worms_website = var_worms_website)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **integer**| Max rows to return | [optional] 
 **fields** | list( **character** )| Comma-separated column filter | [optional] 
 **offset** | **integer**| Rows to skip before beginning to return records. | [optional] 
 **redirect** | **character**| Force S3 pre-signed redirect | [optional] 
 **data_format** | **character**| Response format: json, csv, or parquet | [optional] 
 **response_mode** | **character**| Delivery mode: data, package | [optional] 
 **include_noncore_fields** | **character**| All fields returned when true, else only core fields returned. | [optional] 
 **bottom_trawl_taxon_alias** | [**character**](.md)| Bottom Trawl preferred alias | [optional] 
 **hierarchy_level_name** | [**character**](.md)| Taxonomic rank (e.g. Species, Genus) | [optional] 
 **hook_and_line_taxon_alias** | [**character**](.md)| Hook &amp; Line preferred alias | [optional] 
 **is_bird** | [**character**](.md)| Flag indicating if taxon is a bird | [optional] 
 **is_bony_fish** | [**character**](.md)| Flag indicating if taxon is a bony fish | [optional] 
 **is_coral** | [**character**](.md)| Flag indicating if taxon is a coral | [optional] 
 **is_herring** | [**character**](.md)| Flag indicating if taxon is a herring | [optional] 
 **is_invertebrate** | [**character**](.md)| Flag indicating if taxon is an invertebrate | [optional] 
 **is_jawless_fish** | [**character**](.md)| Flag indicating if taxon is a jawless fish | [optional] 
 **is_mammal** | [**character**](.md)| Flag indicating if taxon is a mammal | [optional] 
 **is_nonspecific_organic** | [**character**](.md)| Flag indicating if taxon is nonspecific organic | [optional] 
 **is_pacific_salmon** | [**character**](.md)| Flag indicating if taxon is a Pacific salmon | [optional] 
 **is_reptile** | [**character**](.md)| Flag indicating if taxon is a reptile | [optional] 
 **is_rockfish** | [**character**](.md)| Flag indicating if taxon is a rockfish | [optional] 
 **is_skate** | [**character**](.md)| Flag indicating if taxon is a skate | [optional] 
 **is_smelt** | [**character**](.md)| Flag indicating if taxon is a smelt | [optional] 
 **is_sponge** | [**character**](.md)| Flag indicating if taxon is a sponge | [optional] 
 **is_squid** | [**character**](.md)| Flag indicating if taxon is a squid | [optional] 
 **is_vertebrate** | [**character**](.md)| Flag indicating if taxon is a vertebrate | [optional] 
 **itis_tsn** | [**character**](.md)| ITIS Taxonomic Serial Number | [optional] 
 **itis_website** | [**character**](.md)| Link to ITIS website | [optional] 
 **legacy_warehouse_source_taxon_key** | [**character**](.md)| Source key for legacy warehouse | [optional] 
 **parent_scientific_name** | [**character**](.md)| Scientific name of the parent taxon | [optional] 
 **scientific_name** | [**character**](.md)| Scientific name of the taxon | [optional] 
 **taxon_aliases** | [**character**](.md)| Array of aliases for the taxon | [optional] 
 **taxon_category** | [**character**](.md)| Broad category of the taxon | [optional] 
 **taxon_subcategory** | [**character**](.md)| Subcategory of the taxon | [optional] 
 **worms_aphia_id** | [**character**](.md)| WoRMS AphiaID | [optional] 
 **worms_website** | [**character**](.md)| Link to WoRMS website | [optional] 

### Return type

[**array[NwfscSurveyTaxonomy]**](nwfsc_survey_taxonomy.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/csv, application/zip, application/vnd.apache.parquet

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Success |  -  |
| **302** | Redirect to S3 for large sets or alternative formats |  * Location - The pre-signed S3 URL <br>  |

# **GetNwfscTriennialSpecimenLengths**
> array[NwfscTriennialSpecimenLengths] GetNwfscTriennialSpecimenLengths(limit = var.limit, fields = var.fields, offset = var.offset, redirect = var.redirect, data_format = var.data_format, response_mode = var.response_mode, include_noncore_fields = var.include_noncore_fields, actual_station_centroid_key = var.actual_station_centroid_key, actual_station_code = var.actual_station_code, actual_station_current_deactivation_reasons = var.actual_station_current_deactivation_reasons, actual_station_deactivation_year = var.actual_station_deactivation_year, actual_station_depth_stratum_name = var.actual_station_depth_stratum_name, actual_station_latitude_stratum_name = var.actual_station_latitude_stratum_name, best_available_taxon_common_name = var.best_available_taxon_common_name, best_available_taxon_scientific_name = var.best_available_taxon_scientific_name, best_tow_latitude_dd = var.best_tow_latitude_dd, best_tow_location_calculation_method_id = var.best_tow_location_calculation_method_id, best_tow_longitude_dd = var.best_tow_longitude_dd, bottom_trawl_operation_key = var.bottom_trawl_operation_key, bottom_trawl_triennial_specimen_length_id = var.bottom_trawl_triennial_specimen_length_id, is_actual_station_currently_active = var.is_actual_station_currently_active, net_off_bottom_at = var.net_off_bottom_at, net_off_bottom_vessel_latitude_dd = var.net_off_bottom_vessel_latitude_dd, net_off_bottom_vessel_longitude_dd = var.net_off_bottom_vessel_longitude_dd, net_on_bottom_at = var.net_on_bottom_at, net_on_bottom_vessel_latitude_dd = var.net_on_bottom_vessel_latitude_dd, net_on_bottom_vessel_longitude_dd = var.net_on_bottom_vessel_longitude_dd, nmfs_project_name = var.nmfs_project_name, on_bottom_seafloor_depth_m = var.on_bottom_seafloor_depth_m, sampling_date = var.sampling_date, specimen_sex_code = var.specimen_sex_code, specimen_sex_name = var.specimen_sex_name, specimen_size_cm = var.specimen_size_cm, specimen_size_type_name = var.specimen_size_type_name, survey_year = var.survey_year, tow_performance_name = var.tow_performance_name, vessel_name = var.vessel_name, was_actual_station_active_when_sampled = var.was_actual_station_active_when_sampled, was_target_station_active_when_sampled = var.was_target_station_active_when_sampled)

AFSC/RACE Bottom Trawl Triennial Specimen Lengths

Report storing one record per lengthed individual fish from the AFSC/RACE triennial bottom trawl surveys.   Each record must contain the best taxonomic identification of the individual and a length/width. Width measurements are  restricted to skate disc width measurements, with a majority of other measurements categorized as fork/anal/total lengths.    Lenghts from the following AFSC/RACE surveys, typically occuring at three-year increments:    Lengths from the following AFSC/RACE surveys, typically occurring at three-year increments:    * **AFSC/RACE Triennial Groundfish Shelf Survey** (1977 – 2001)  * **AFSC/RACE Slope Survey Fishing Power Comparative Study** (1988, 1993)  * **AFSC/RACE Slope Survey Nonstandard Sampling** (1996)    Included in this report are select spatiotemporal and environmental data points related to vessel and tow performance,   taxonomic identification, and size values and size (length/width) types.

### Example
```R
library(nwfscDataCatalog)

# AFSC/RACE Bottom Trawl Triennial Specimen Lengths
#
# prepare function argument(s)
var_limit <- 56 # integer | Max rows to return (Optional)
var_fields <- c("inner_example") # array[character] | Comma-separated column filter (Optional)
var_offset <- 56 # integer | Rows to skip before beginning to return records. (Optional)
var_redirect <- "redirect_example" # character | Force S3 pre-signed redirect (Optional)
var_data_format <- "data_format_example" # character | Response format: json, csv, or parquet (Optional)
var_response_mode <- "response_mode_example" # character | Delivery mode: data, package (Optional)
var_include_noncore_fields <- "include_noncore_fields_example" # character | All fields returned when true, else only core fields returned. (Optional)
var_actual_station_centroid_key <- "actual_station_centroid_key_example" # character | A composite spatial key that uniquely identifies the centroid of a WCGBTS (West Coast Groundfish Bottom Trawl Survey) sampling station grid cell.     This key is a fixed 8-character string constructed by converting decimal degree coordinates into Degrees and Decimal Minutes (DDM), stripping away negative signs and truncating specific digits to create a consistent spatial identifier.    ### Component Breakdown  The 8-character format strictly follows the pattern **`[Lat Degrees][Lat Minutes][Lon Degrees][Lon Minutes]`**:    * **Latitude Degrees (2 characters):** The whole number of the decimal latitude (e.g., `43.58` becomes `43`).  * **Latitude Minutes (2 characters):** The decimal remainder of the latitude multiplied by 60 and rounded to the nearest whole number (e.g., `0.58139 * 60 = 34.88`, which rounds to `35`).  * **Longitude Degrees (2 characters):** The whole number of the longitude, ignoring the negative sign (West) and dropping the leading hundreds place (e.g., `-124.61` becomes `24`).  * **Longitude Minutes (2 characters):** The decimal remainder of the longitude multiplied by 60 and rounded to the nearest whole number (e.g., `0.61465 * 60 = 36.87`, which rounds to `37`).    > **Example:** A grid cell centroid located at decimal coordinates **`43.58139678, -124.61465068`** results in the centroid key **`43352437`**. (Optional)
var_actual_station_code <- "actual_station_code_example" # character | Unique identifier for the sampling site visited. For the West Coast Groundfish Bottom Trawl Shelf/Slope Survey, sites follow a gridded pattern. Site codes incrementing sequentially by one from North to South and West to East, with the site furthest to the North starting at 4039 and the site furthest to the south ending at 23399. Most site codes are integers, but present as text data types to accommodate historical formats which included alphanumeric values. Historical site splits are represented by floating point numbers (site 44444 split to 44444.1 and 44444.2). The \"best\" sampling site designation indicates that the single summarized tow/haul location falls within this site boundary. The \"target\" site may diverge from the \"best\" in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to this preferred geolocated site. (Optional)
var_actual_station_current_deactivation_reasons <- "actual_station_current_deactivation_reasons_example" # character | Comma-separated list of current reasons that a station is listed as inactive.  Value should be null unless the station is currently inactive. (Optional)
var_actual_station_deactivation_year <- "actual_station_deactivation_year_example" # character | The year YYYY when the actual station sampled was last deactivated, if the site is currently inactive. The \"best\" sampling site designation indicates that the single summarized tow/haul location falls within this site boundary. The \"target\" site may diverge from the \"best\" in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to this preferred geolocated site. (Optional)
var_actual_station_depth_stratum_name <- "actual_station_depth_stratum_name_example" # character | Name of the depth stratum that the sampling site falls into. Sampling on the West Coast Groundfish Bottom Trawl Shelf/Slope Survey follows a randomly stratified design, with sampling sites falling into one of three depth strata: 30-100 fathoms, 100-300 fathoms, and 300-700 fathoms. The \"best\" sampling site designation indicates that the single summarized tow/haul location falls within this site boundary. The \"target\" site may diverge from the \"best\" in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to this preferred geolocated site. (Optional)
var_actual_station_latitude_stratum_name <- "actual_station_latitude_stratum_name_example" # character | Name of the latitude stratum that the sampling site falls into. Sampling on the West Coast Groundfish Bottom Trawl Shelf/Slope Survey follows a randomly stratified design, with sampling sites falling into one of two latitude strata: North of Point Conception (>34°30'N) or South of Point Conception (<34°30'N). The \"best\" sampling site designation indicates that the single summarized tow/haul location falls within this site boundary. The \"target\" site may diverge from the \"best\" in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to this preferred geolocated site. (Optional)
var_best_available_taxon_common_name <- "best_available_taxon_common_name_example" # character | Field identified scientific name for the sampled taxon. (Optional)
var_best_available_taxon_scientific_name <- "best_available_taxon_scientific_name_example" # character | Best available scientific name for the sampled taxon. (Optional)
var_best_tow_latitude_dd <- "best_tow_latitude_dd_example" # character | Latitude of the single point in space that best represents where the tow sampling took place. Latitude presented as decimal degrees with up to eight points of precision. (Optional)
var_best_tow_location_calculation_method_id <- "best_tow_location_calculation_method_id_example" # character | Filter by best_tow_location_calculation_method_id (Optional)
var_best_tow_longitude_dd <- "best_tow_longitude_dd_example" # character | Longitude of the single point in space that best represents where the tow sampling took place. Longitude presented as decimal degrees with up to eight points of precision. (Optional)
var_bottom_trawl_operation_key <- "bottom_trawl_operation_key_example" # character | A 12-character numeric unique identifier for a West Coast Groundfish Bottom Trawl sampling operation.     It is constructed by concatenating key operational attributes into a single string. For example, the operation key **`202203020001`** breaks down as follows:    * **Survey Year (Digits 1-4):** The 4-digit year (YYYY) of sampling (e.g., `2022`).  * **Operation Type (Digits 5-6):** The 2-digit code representing the survey operation type (e.g., `03`).  * **Vessel ID (Digits 7-9):** The 3-digit, zero-padded identifier for the participating vessel (e.g., `020`).  * **Operation Increment (Digits 10-12):** The 3-digit, zero-padded sequential operation increment (e.g., `001`). (Optional)
var_bottom_trawl_triennial_specimen_length_id <- "bottom_trawl_triennial_specimen_length_id_example" # character | Surrogate unique key for each triennial specimen length record. (Optional)
var_is_actual_station_currently_active <- "is_actual_station_currently_active_example" # character | Boolean indicating if the actual station sampled is currently active. The \"best\" sampling site designation indicates that the single summarized tow/haul location falls within this site boundary. The \"target\" site may diverge from the \"best\" in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to this preferred geolocated site. (Optional)
var_net_off_bottom_at <- "net_off_bottom_at_example" # character | when the footrope loses contact with the bottom after haulback has begun, marking the end of \"sampling\" / \"fishing\" for the tow. UTC Date and time with timezone offset following in ISO 8601 (`YYYY-MM-DD HH:MM:SS+00`). Timestamp is to seconds precision (no fractional seconds). (Optional)
var_net_off_bottom_vessel_latitude_dd <- "net_off_bottom_vessel_latitude_dd_example" # character | Latitude of the vessel when the footrope loses contact with the bottom after haulback has begun, marking the end of \"sampling\" / \"fishing\" for the tow. Latitude presented as decimal degrees with up to eight points of precision. (Optional)
var_net_off_bottom_vessel_longitude_dd <- "net_off_bottom_vessel_longitude_dd_example" # character | Longitude of the vessel when the footrope loses contact with the bottom after haulback has begun, marking the end of \"sampling\" / \"fishing\" for the tow. Longitude presented as decimal degrees with up to eight points of precision. (Optional)
var_net_on_bottom_at <- "net_on_bottom_at_example" # character | when the footrope initially makes contact with the bottom, marking the start of \"sampling\" / \"fishing\" for the tow. UTC Date and time with timezone offset following in ISO 8601 (`YYYY-MM-DD HH:MM:SS+00`). Timestamp is to seconds precision (no fractional seconds). (Optional)
var_net_on_bottom_vessel_latitude_dd <- "net_on_bottom_vessel_latitude_dd_example" # character | Latitude of the vessel when the footrope initially makes contact with the bottom, marking the start of \"sampling\" / \"fishing\" for the tow. Latitude presented as decimal degrees with up to eight points of precision. (Optional)
var_net_on_bottom_vessel_longitude_dd <- "net_on_bottom_vessel_longitude_dd_example" # character | Longitude of the vessel when the footrope initially makes contact with the bottom, marking the start of \"sampling\" / \"fishing\" for the tow. Longitude presented as decimal degrees with up to eight points of precision. (Optional)
var_nmfs_project_name <- "nmfs_project_name_example" # character | Name of the project/survey under the National Marine Fisheries Service (NMFS) for which the data was collected. (Optional)
var_on_bottom_seafloor_depth_m <- "on_bottom_seafloor_depth_m_example" # character | the depth of the seafloor to sea surface surface in meters. (Optional)
var_sampling_date <- "sampling_date_example" # character | Date that the individual was sampled in the field. (Optional)
var_specimen_sex_code <- "specimen_sex_code_example" # character | Abbreviated code for the specimen's sex (e.g., M, F, U). (Optional)
var_specimen_sex_name <- "specimen_sex_name_example" # character | Full descriptive name for the specimen's sex. (Optional)
var_specimen_size_cm <- "specimen_size_cm_example" # character | The total length/width/dimension of the sampled fish/specimen, measured in centimeters. (Optional)
var_specimen_size_type_name <- "specimen_size_type_name_example" # character | Descriptive name of the associated specimen size (e.g. lenght/width) (Optional)
var_survey_year <- "survey_year_example" # character | Calendar year in integer format YYYY during which data was collected. (Optional)
var_tow_performance_name <- "tow_performance_name_example" # character | Descriptive name of the tow performance status. (Optional)
var_vessel_name <- "vessel_name_example" # character | Full capitalized name of the commercial or research vessel used to collect the data at sea.  As a general rule, names do not include the preceiding ship   or vessel prefix (i.e. Last Straw, NOT F/V Last Straw). (Optional)
var_was_actual_station_active_when_sampled <- "was_actual_station_active_when_sampled_example" # character | Boolean indicating if the actual station was active at the time it was sampled. The \"best\" sampling site designation indicates that the single summarized tow/haul location falls within this site boundary. The \"target\" site may diverge from the \"best\" in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to this preferred geolocated site. (Optional)
var_was_target_station_active_when_sampled <- "was_target_station_active_when_sampled_example" # character | Boolean indicating if the target station was active at the time of sampling. The \"target\" sampling site designation indicates that the site was the target for sampling for the particular operation. The \"target\" site may diverge from the \"best\" in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to the \"best\" preferred geolocated site. (Optional)

api_instance <- DefaultApi$new()
# to save the result into a file, simply add the optional `data_file` parameter, e.g.
# result <- api_instance$GetNwfscTriennialSpecimenLengths(limit = var_limit, fields = var_fields, offset = var_offset, redirect = var_redirect, data_format = var_data_format, response_mode = var_response_mode, include_noncore_fields = var_include_noncore_fields, actual_station_centroid_key = var_actual_station_centroid_key, actual_station_code = var_actual_station_code, actual_station_current_deactivation_reasons = var_actual_station_current_deactivation_reasons, actual_station_deactivation_year = var_actual_station_deactivation_year, actual_station_depth_stratum_name = var_actual_station_depth_stratum_name, actual_station_latitude_stratum_name = var_actual_station_latitude_stratum_name, best_available_taxon_common_name = var_best_available_taxon_common_name, best_available_taxon_scientific_name = var_best_available_taxon_scientific_name, best_tow_latitude_dd = var_best_tow_latitude_dd, best_tow_location_calculation_method_id = var_best_tow_location_calculation_method_id, best_tow_longitude_dd = var_best_tow_longitude_dd, bottom_trawl_operation_key = var_bottom_trawl_operation_key, bottom_trawl_triennial_specimen_length_id = var_bottom_trawl_triennial_specimen_length_id, is_actual_station_currently_active = var_is_actual_station_currently_active, net_off_bottom_at = var_net_off_bottom_at, net_off_bottom_vessel_latitude_dd = var_net_off_bottom_vessel_latitude_dd, net_off_bottom_vessel_longitude_dd = var_net_off_bottom_vessel_longitude_dd, net_on_bottom_at = var_net_on_bottom_at, net_on_bottom_vessel_latitude_dd = var_net_on_bottom_vessel_latitude_dd, net_on_bottom_vessel_longitude_dd = var_net_on_bottom_vessel_longitude_dd, nmfs_project_name = var_nmfs_project_name, on_bottom_seafloor_depth_m = var_on_bottom_seafloor_depth_m, sampling_date = var_sampling_date, specimen_sex_code = var_specimen_sex_code, specimen_sex_name = var_specimen_sex_name, specimen_size_cm = var_specimen_size_cm, specimen_size_type_name = var_specimen_size_type_name, survey_year = var_survey_year, tow_performance_name = var_tow_performance_name, vessel_name = var_vessel_name, was_actual_station_active_when_sampled = var_was_actual_station_active_when_sampled, was_target_station_active_when_sampled = var_was_target_station_active_when_sampleddata_file = "result.txt")
result <- api_instance$GetNwfscTriennialSpecimenLengths(limit = var_limit, fields = var_fields, offset = var_offset, redirect = var_redirect, data_format = var_data_format, response_mode = var_response_mode, include_noncore_fields = var_include_noncore_fields, actual_station_centroid_key = var_actual_station_centroid_key, actual_station_code = var_actual_station_code, actual_station_current_deactivation_reasons = var_actual_station_current_deactivation_reasons, actual_station_deactivation_year = var_actual_station_deactivation_year, actual_station_depth_stratum_name = var_actual_station_depth_stratum_name, actual_station_latitude_stratum_name = var_actual_station_latitude_stratum_name, best_available_taxon_common_name = var_best_available_taxon_common_name, best_available_taxon_scientific_name = var_best_available_taxon_scientific_name, best_tow_latitude_dd = var_best_tow_latitude_dd, best_tow_location_calculation_method_id = var_best_tow_location_calculation_method_id, best_tow_longitude_dd = var_best_tow_longitude_dd, bottom_trawl_operation_key = var_bottom_trawl_operation_key, bottom_trawl_triennial_specimen_length_id = var_bottom_trawl_triennial_specimen_length_id, is_actual_station_currently_active = var_is_actual_station_currently_active, net_off_bottom_at = var_net_off_bottom_at, net_off_bottom_vessel_latitude_dd = var_net_off_bottom_vessel_latitude_dd, net_off_bottom_vessel_longitude_dd = var_net_off_bottom_vessel_longitude_dd, net_on_bottom_at = var_net_on_bottom_at, net_on_bottom_vessel_latitude_dd = var_net_on_bottom_vessel_latitude_dd, net_on_bottom_vessel_longitude_dd = var_net_on_bottom_vessel_longitude_dd, nmfs_project_name = var_nmfs_project_name, on_bottom_seafloor_depth_m = var_on_bottom_seafloor_depth_m, sampling_date = var_sampling_date, specimen_sex_code = var_specimen_sex_code, specimen_sex_name = var_specimen_sex_name, specimen_size_cm = var_specimen_size_cm, specimen_size_type_name = var_specimen_size_type_name, survey_year = var_survey_year, tow_performance_name = var_tow_performance_name, vessel_name = var_vessel_name, was_actual_station_active_when_sampled = var_was_actual_station_active_when_sampled, was_target_station_active_when_sampled = var_was_target_station_active_when_sampled)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **integer**| Max rows to return | [optional] 
 **fields** | list( **character** )| Comma-separated column filter | [optional] 
 **offset** | **integer**| Rows to skip before beginning to return records. | [optional] 
 **redirect** | **character**| Force S3 pre-signed redirect | [optional] 
 **data_format** | **character**| Response format: json, csv, or parquet | [optional] 
 **response_mode** | **character**| Delivery mode: data, package | [optional] 
 **include_noncore_fields** | **character**| All fields returned when true, else only core fields returned. | [optional] 
 **actual_station_centroid_key** | [**character**](.md)| A composite spatial key that uniquely identifies the centroid of a WCGBTS (West Coast Groundfish Bottom Trawl Survey) sampling station grid cell.     This key is a fixed 8-character string constructed by converting decimal degree coordinates into Degrees and Decimal Minutes (DDM), stripping away negative signs and truncating specific digits to create a consistent spatial identifier.    ### Component Breakdown  The 8-character format strictly follows the pattern **&#x60;[Lat Degrees][Lat Minutes][Lon Degrees][Lon Minutes]&#x60;**:    * **Latitude Degrees (2 characters):** The whole number of the decimal latitude (e.g., &#x60;43.58&#x60; becomes &#x60;43&#x60;).  * **Latitude Minutes (2 characters):** The decimal remainder of the latitude multiplied by 60 and rounded to the nearest whole number (e.g., &#x60;0.58139 * 60 &#x3D; 34.88&#x60;, which rounds to &#x60;35&#x60;).  * **Longitude Degrees (2 characters):** The whole number of the longitude, ignoring the negative sign (West) and dropping the leading hundreds place (e.g., &#x60;-124.61&#x60; becomes &#x60;24&#x60;).  * **Longitude Minutes (2 characters):** The decimal remainder of the longitude multiplied by 60 and rounded to the nearest whole number (e.g., &#x60;0.61465 * 60 &#x3D; 36.87&#x60;, which rounds to &#x60;37&#x60;).    &gt; **Example:** A grid cell centroid located at decimal coordinates **&#x60;43.58139678, -124.61465068&#x60;** results in the centroid key **&#x60;43352437&#x60;**. | [optional] 
 **actual_station_code** | [**character**](.md)| Unique identifier for the sampling site visited. For the West Coast Groundfish Bottom Trawl Shelf/Slope Survey, sites follow a gridded pattern. Site codes incrementing sequentially by one from North to South and West to East, with the site furthest to the North starting at 4039 and the site furthest to the south ending at 23399. Most site codes are integers, but present as text data types to accommodate historical formats which included alphanumeric values. Historical site splits are represented by floating point numbers (site 44444 split to 44444.1 and 44444.2). The \&quot;best\&quot; sampling site designation indicates that the single summarized tow/haul location falls within this site boundary. The \&quot;target\&quot; site may diverge from the \&quot;best\&quot; in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to this preferred geolocated site. | [optional] 
 **actual_station_current_deactivation_reasons** | [**character**](.md)| Comma-separated list of current reasons that a station is listed as inactive.  Value should be null unless the station is currently inactive. | [optional] 
 **actual_station_deactivation_year** | [**character**](.md)| The year YYYY when the actual station sampled was last deactivated, if the site is currently inactive. The \&quot;best\&quot; sampling site designation indicates that the single summarized tow/haul location falls within this site boundary. The \&quot;target\&quot; site may diverge from the \&quot;best\&quot; in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to this preferred geolocated site. | [optional] 
 **actual_station_depth_stratum_name** | [**character**](.md)| Name of the depth stratum that the sampling site falls into. Sampling on the West Coast Groundfish Bottom Trawl Shelf/Slope Survey follows a randomly stratified design, with sampling sites falling into one of three depth strata: 30-100 fathoms, 100-300 fathoms, and 300-700 fathoms. The \&quot;best\&quot; sampling site designation indicates that the single summarized tow/haul location falls within this site boundary. The \&quot;target\&quot; site may diverge from the \&quot;best\&quot; in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to this preferred geolocated site. | [optional] 
 **actual_station_latitude_stratum_name** | [**character**](.md)| Name of the latitude stratum that the sampling site falls into. Sampling on the West Coast Groundfish Bottom Trawl Shelf/Slope Survey follows a randomly stratified design, with sampling sites falling into one of two latitude strata: North of Point Conception (&gt;34°30&#39;N) or South of Point Conception (&lt;34°30&#39;N). The \&quot;best\&quot; sampling site designation indicates that the single summarized tow/haul location falls within this site boundary. The \&quot;target\&quot; site may diverge from the \&quot;best\&quot; in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to this preferred geolocated site. | [optional] 
 **best_available_taxon_common_name** | [**character**](.md)| Field identified scientific name for the sampled taxon. | [optional] 
 **best_available_taxon_scientific_name** | [**character**](.md)| Best available scientific name for the sampled taxon. | [optional] 
 **best_tow_latitude_dd** | [**character**](.md)| Latitude of the single point in space that best represents where the tow sampling took place. Latitude presented as decimal degrees with up to eight points of precision. | [optional] 
 **best_tow_location_calculation_method_id** | [**character**](.md)| Filter by best_tow_location_calculation_method_id | [optional] 
 **best_tow_longitude_dd** | [**character**](.md)| Longitude of the single point in space that best represents where the tow sampling took place. Longitude presented as decimal degrees with up to eight points of precision. | [optional] 
 **bottom_trawl_operation_key** | [**character**](.md)| A 12-character numeric unique identifier for a West Coast Groundfish Bottom Trawl sampling operation.     It is constructed by concatenating key operational attributes into a single string. For example, the operation key **&#x60;202203020001&#x60;** breaks down as follows:    * **Survey Year (Digits 1-4):** The 4-digit year (YYYY) of sampling (e.g., &#x60;2022&#x60;).  * **Operation Type (Digits 5-6):** The 2-digit code representing the survey operation type (e.g., &#x60;03&#x60;).  * **Vessel ID (Digits 7-9):** The 3-digit, zero-padded identifier for the participating vessel (e.g., &#x60;020&#x60;).  * **Operation Increment (Digits 10-12):** The 3-digit, zero-padded sequential operation increment (e.g., &#x60;001&#x60;). | [optional] 
 **bottom_trawl_triennial_specimen_length_id** | [**character**](.md)| Surrogate unique key for each triennial specimen length record. | [optional] 
 **is_actual_station_currently_active** | [**character**](.md)| Boolean indicating if the actual station sampled is currently active. The \&quot;best\&quot; sampling site designation indicates that the single summarized tow/haul location falls within this site boundary. The \&quot;target\&quot; site may diverge from the \&quot;best\&quot; in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to this preferred geolocated site. | [optional] 
 **net_off_bottom_at** | [**character**](.md)| when the footrope loses contact with the bottom after haulback has begun, marking the end of \&quot;sampling\&quot; / \&quot;fishing\&quot; for the tow. UTC Date and time with timezone offset following in ISO 8601 (&#x60;YYYY-MM-DD HH:MM:SS+00&#x60;). Timestamp is to seconds precision (no fractional seconds). | [optional] 
 **net_off_bottom_vessel_latitude_dd** | [**character**](.md)| Latitude of the vessel when the footrope loses contact with the bottom after haulback has begun, marking the end of \&quot;sampling\&quot; / \&quot;fishing\&quot; for the tow. Latitude presented as decimal degrees with up to eight points of precision. | [optional] 
 **net_off_bottom_vessel_longitude_dd** | [**character**](.md)| Longitude of the vessel when the footrope loses contact with the bottom after haulback has begun, marking the end of \&quot;sampling\&quot; / \&quot;fishing\&quot; for the tow. Longitude presented as decimal degrees with up to eight points of precision. | [optional] 
 **net_on_bottom_at** | [**character**](.md)| when the footrope initially makes contact with the bottom, marking the start of \&quot;sampling\&quot; / \&quot;fishing\&quot; for the tow. UTC Date and time with timezone offset following in ISO 8601 (&#x60;YYYY-MM-DD HH:MM:SS+00&#x60;). Timestamp is to seconds precision (no fractional seconds). | [optional] 
 **net_on_bottom_vessel_latitude_dd** | [**character**](.md)| Latitude of the vessel when the footrope initially makes contact with the bottom, marking the start of \&quot;sampling\&quot; / \&quot;fishing\&quot; for the tow. Latitude presented as decimal degrees with up to eight points of precision. | [optional] 
 **net_on_bottom_vessel_longitude_dd** | [**character**](.md)| Longitude of the vessel when the footrope initially makes contact with the bottom, marking the start of \&quot;sampling\&quot; / \&quot;fishing\&quot; for the tow. Longitude presented as decimal degrees with up to eight points of precision. | [optional] 
 **nmfs_project_name** | [**character**](.md)| Name of the project/survey under the National Marine Fisheries Service (NMFS) for which the data was collected. | [optional] 
 **on_bottom_seafloor_depth_m** | [**character**](.md)| the depth of the seafloor to sea surface surface in meters. | [optional] 
 **sampling_date** | [**character**](.md)| Date that the individual was sampled in the field. | [optional] 
 **specimen_sex_code** | [**character**](.md)| Abbreviated code for the specimen&#39;s sex (e.g., M, F, U). | [optional] 
 **specimen_sex_name** | [**character**](.md)| Full descriptive name for the specimen&#39;s sex. | [optional] 
 **specimen_size_cm** | [**character**](.md)| The total length/width/dimension of the sampled fish/specimen, measured in centimeters. | [optional] 
 **specimen_size_type_name** | [**character**](.md)| Descriptive name of the associated specimen size (e.g. lenght/width) | [optional] 
 **survey_year** | [**character**](.md)| Calendar year in integer format YYYY during which data was collected. | [optional] 
 **tow_performance_name** | [**character**](.md)| Descriptive name of the tow performance status. | [optional] 
 **vessel_name** | [**character**](.md)| Full capitalized name of the commercial or research vessel used to collect the data at sea.  As a general rule, names do not include the preceiding ship   or vessel prefix (i.e. Last Straw, NOT F/V Last Straw). | [optional] 
 **was_actual_station_active_when_sampled** | [**character**](.md)| Boolean indicating if the actual station was active at the time it was sampled. The \&quot;best\&quot; sampling site designation indicates that the single summarized tow/haul location falls within this site boundary. The \&quot;target\&quot; site may diverge from the \&quot;best\&quot; in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to this preferred geolocated site. | [optional] 
 **was_target_station_active_when_sampled** | [**character**](.md)| Boolean indicating if the target station was active at the time of sampling. The \&quot;target\&quot; sampling site designation indicates that the site was the target for sampling for the particular operation. The \&quot;target\&quot; site may diverge from the \&quot;best\&quot; in the event that the tow operation carries the sampling outside of the intended site boundary, and the tow is then actually assigned to the \&quot;best\&quot; preferred geolocated site. | [optional] 

### Return type

[**array[NwfscTriennialSpecimenLengths]**](nwfsc_triennial_specimen_lengths.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/csv, application/zip, application/vnd.apache.parquet

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Success |  -  |
| **302** | Redirect to S3 for large sets or alternative formats |  * Location - The pre-signed S3 URL <br>  |

