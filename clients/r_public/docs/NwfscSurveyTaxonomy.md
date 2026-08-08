# nwfscDataCatalog::NwfscSurveyTaxonomy


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**is_bird** | **character** | Flag indicating if taxon is a bird | [optional] 
**is_coral** | **character** | Flag indicating if taxon is a coral | [optional] 
**is_skate** | **character** | Flag indicating if taxon is a skate | [optional] 
**is_smelt** | **character** | Flag indicating if taxon is a smelt | [optional] 
**is_squid** | **character** | Flag indicating if taxon is a squid | [optional] 
**itis_tsn** | **integer** | ITIS Taxonomic Serial Number | [optional] 
**is_mammal** | **character** | Flag indicating if taxon is a mammal | [optional] 
**is_sponge** | **character** | Flag indicating if taxon is a sponge | [optional] 
**is_herring** | **character** | Flag indicating if taxon is a herring | [optional] 
**is_reptile** | **character** | Flag indicating if taxon is a reptile | [optional] 
**is_rockfish** | **character** | Flag indicating if taxon is a rockfish | [optional] 
**is_bony_fish** | **character** | Flag indicating if taxon is a bony fish | [optional] 
**itis_lineage** | **object** | An ordered array of JSON documents representing each level of the ITIS taxonomic lineage, where the final entry contains ITIS TSN and URL mappings. | [optional] 
**itis_website** | **character** | Link to ITIS website | [optional] 
**is_vertebrate** | **character** | Flag indicating if taxon is a vertebrate | [optional] 
**nwfsc_lineage** | **object** | An ordered array of JSON documents representing each level of the NWFSC taxonomic lineage, where the final entry in the array corresponds to the current taxon and contains authority website linkages and IDs. | [optional] 
**taxon_aliases** | **character** | Array of aliases for the taxon | [optional] 
**worms_lineage** | **object** | An ordered array of JSON documents representing each level of the WoRMS taxonomic lineage, where the final entry contains WoRMS Aphia ID and URL mappings. | [optional] 
**worms_website** | **character** | Link to WoRMS website | [optional] 
**taxon_category** | **character** | Broad category of the taxon | [optional] 
**worms_aphia_id** | **integer** | WoRMS AphiaID | [optional] 
**is_invertebrate** | **character** | Flag indicating if taxon is an invertebrate | [optional] 
**is_jawless_fish** | **character** | Flag indicating if taxon is a jawless fish | [optional] 
**itis_api_result** | **object** | Full API result from ITIS | [optional] 
**scientific_name** | **character** | Scientific name of the taxon | [optional] 
**worms_api_result** | **object** | Full API result from WoRMS | [optional] 
**is_pacific_salmon** | **character** | Flag indicating if taxon is a Pacific salmon | [optional] 
**taxon_subcategory** | **character** | Subcategory of the taxon | [optional] 
**hierarchy_level_name** | **character** | Taxonomic rank (e.g. Species, Genus) | [optional] 
**taxon_change_history** | **object** | Aggregated historical records of taxonomic changes tracked over time as a Slowly Changing Dimension (SCD Type 2). | [optional] 
**is_nonspecific_organic** | **character** | Flag indicating if taxon is nonspecific organic | [optional] 
**parent_scientific_name** | **character** | Scientific name of the parent taxon | [optional] 
**bottom_trawl_taxon_alias** | **character** | Bottom Trawl preferred alias | [optional] 
**hook_and_line_taxon_alias** | **character** | Hook &amp; Line preferred alias | [optional] 
**legacy_warehouse_source_taxon_key** | **character** | Source key for legacy warehouse | [optional] 


