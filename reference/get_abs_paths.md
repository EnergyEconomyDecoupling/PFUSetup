# Get absolute paths to important files and folders appropriate for this computer

Default argument values assume a directory structure that includes
Dropbox and is appropriate for the Fellowship project for Dr. Paul
Brockway.

## Usage

``` r
get_abs_paths(
  home_path = as.character(fs::path_home()),
  cloud_storage_path = "OneDrive - University of Leeds",
  project_path = file.path(cloud_storage_path,
    "Fellowship 1960-2015 PFU database research"),
  iea_year = "2022",
  iea_folder_path = file.path(project_path, "Input Data", "External Data",
    "IEA extended energy balance data", paste("IEA", iea_year, "energy balance data")),
  iea_data_path = file.path(iea_folder_path, paste("IEA Extended Energy Balances",
    iea_year, "(TJ).csv")),
  version = "v3.0",
  input_data_path = file.path(project_path, "Input Data", "CL-PFU Data", version),
  output_data_path = file.path(project_path, "Output Data"),
  schema_path = file.path(input_data_path, "SchemaAndFKTables.xlsx"),
  fao_data_path = file.path(input_data_path, "fao_qcl_data.rds"),
  ilo_employment_data_path = file.path(input_data_path, "ilo_employment_data.rds"),
  ilo_working_hours_data_path = file.path(input_data_path, "ilo_working_hours_data.rds"),
  hmw_analysis_data_path = file.path(input_data_path, "hmw_analysis_data.xlsx"),
  amw_analysis_data_path = file.path(input_data_path, "amw_analysis_data.xlsx"),
  mw_concordance_path = file.path(input_data_path, "FAO_ISO_MW_Mapping.xlsx"),
  country_concordance_path = file.path(input_data_path, "Country_Concordance_Full.xlsx"),
  aggregation_mapping_path = file.path(input_data_path, "aggregation_mapping.xlsx"),
  phi_constants_path = file.path(input_data_path, "phi_constants.xlsx"),
  exemplar_table_path = file.path(input_data_path, "Exemplar_Table.xlsx"),
  fu_analysis_folder = file.path(input_data_path, "FU allocation data"),
  machine_data_folder = file.path(input_data_path, "Machines - Data"),
  ceda_data_folder = file.path(input_data_path, "CEDA Data"),
  exiobase_energy_flows_path = file.path(input_data_path,
    "exiobase_energy_flows_concordance.xlsx"),
  reports_source_folders = "reports",
  reports_dest_folder = file.path(output_data_path, version, "Reports"),
  pipeline_releases_folder = file.path(output_data_path, "old_pins", "PipelineReleases"),
  versions_and_products_path = file.path(pipeline_releases_folder,
    "versions and products.xlsx"),
  fsep = .Platform$file.sep
)
```

## Arguments

- home_path:

  The absolute path to the user's home directory.

- cloud_storage_path:

  The path to the user's cloud storage directory, relative to
  `home_path`.

- project_path:

  The path to the project directory, relative to `home_path`.

- iea_year:

  The year of IEA data release, as a string.

- iea_folder_path:

  The path to the IEA data directory, relative to `home_path`.

- iea_data_path:

  The path to the IEA data file, relative to `home_path`.

- version:

  The version of the input data.

- input_data_path:

  The path to the input data directory, relative to `home_path`.

- output_data_path:

  The path to the output data directory, relative to `home_path`.

- schema_path:

  The path to the database schema file relative to `project_path`.
  Default is

- fao_data_path:

  The path to the FAO live animals data file, relative to `home_path`.

- ilo_employment_data_path:

  The path to the ILO employment data file, relative to `home_path`.

- ilo_working_hours_data_path:

  The path to the ILO working hours data file, relative to `home_path`.

- hmw_analysis_data_path:

  The path to the human muscle work analysis file, relative to
  `home_path`.

- amw_analysis_data_path:

  The path to the animal muscle work file, relative to `home_path`.

- mw_concordance_path:

  The path to the muscle work country concordance file, relative to
  `home_path`.

- country_concordance_path:

  The path to the country concordance file, relative to `home_path`.

- aggregation_mapping_path:

  The path to the aggregation mapping file, relative to `home_path`.

- phi_constants_path:

  The path to the exergy-to-energy ratio file containing constant
  values, relative to `home_path`.

- exemplar_table_path:

  The path to the exemplar table, relative to `home_path`.

- fu_analysis_folder:

  The path to the folder containing final-to-useful exergy information,
  relative to `home_path`.

- machine_data_folder:

  The path to the folder containing machine-specific efficiencies,
  relative to `home_path`.

- ceda_data_folder:

  The path to the folder containing CEDA (Centre for Environmental Data
  Analysis) data, relative to `home_path`.

- exiobase_energy_flows_path:

  The path to exiobase energy flows.

- reports_source_folders:

  A string vector of paths to folders containing report sources.

- reports_dest_folder:

  The path to the folder into which reports will be written, relative to
  `home_path`.

- pipeline_releases_folder:

  The path to a folder containing released versions of the PSUT target
  data frame, relative to `home_path`. Data are stored using the `pins`
  package. Default is "PipelineReleases" relative to `project_path`.

- versions_and_products_path:

  The path to the versions and products file containing lists of all
  versions and products, relative to `project_path`. Default is
  "versions_and_products.xlsx".

- fsep:

  The file separator used when constructing paths. Default is
  `.Platform$file.sep`.

## Value

A named list containing paths to important directories and files. See
details for output items.

## Details

The default argument for `home_path` gets the value for
[`fs::path_home()`](https://fs.r-lib.org/reference/path_expand.html).

Although this function is called `get_abs_paths()`, it can return
relative paths if both `home_path` and `cloud_storage_path` are set to
"" (an empty string) and `project_path` is set to the root folder of the
project. In that event, the leading file separator (`fsep`) is removed
from the path (if it exists).

Output items include:

- home_path:

  The absolute path to the user's home.

- cloud_storage_path:

  The absolute path of the user's cloud storage folder.

- project_path:

  The absolute path to the project folder.

- iea_folder_path:

  The absolute path to a folder containing IEA data.

- iea_data_path:

  The absolute path to the IEA data file for the OECD countries.

- input_data_path:

  The absolute path to the input data directory.

- output_data_path:

  The absolute path to the output data directory.

- schema_path:

  The absolute path to a Excel schema file.

- fao_data_path:

  The absolute path to the FAO live animals data file.

- ilo_employment_data_path:

  The absolute path to the ILO employment data file.

- ilo_working_hours_data_path:

  The absolute path to the ILO working hours data file.

- hmw_analysis_data_path:

  The absolute path to the human muscle work analysis file.

- amw_analysis_data_path:

  The absolute path to the animal muscle work file.

- mw_concordance_path:

  The absolute path to the muscle work country concordance file.

- country_concordance_path:

  The absolute path to the country concordance file.

- aggregation_mapping_path:

  The absolute path to the aggregation mapping file.

- phi_constants_path:

  The absolute path to the exergy-to-energy ratio file containing
  constant values.

- exemplar_table_path:

  The path to the exemplar table.

- fu_analysis_folder:

  The absolute path to the folder containing final-to-useful exergy
  information.

- machine_data_folder:

  The absolute path to the folder containing machine-specific efficiency
  information.

- ceda_data_folder:

  The absolute path to the folder containing CEDA environment
  information.

- exiobase_energy_flows_path:

  The absolute path to the folder containing Exiobase energy flows
  information.

- reports_source_folders:

  A vector of absolute paths to folders containing source reports.

- reports_dest_folder:

  A directory into which completed reports will be written.

- pipeline_caches_folder:

  The path to a folder that stores zipped versions of the pipeline
  cache.

- pipeline_releases_folder:

  The path to a folder that stores releases of various targets.

- versions_and_products_path:

  The path to the versions and products file.

## Examples

``` r
get_abs_paths()
#> $home_path
#> [1] "/home/runner"
#> 
#> $cloud_storage_path
#> [1] "/home/runner/OneDrive - University of Leeds"
#> 
#> $project_path
#> [1] "/home/runner/OneDrive - University of Leeds/Fellowship 1960-2015 PFU database research"
#> 
#> $iea_folder_path
#> [1] "/home/runner/OneDrive - University of Leeds/Fellowship 1960-2015 PFU database research/Input Data/External Data/IEA extended energy balance data/IEA 2022 energy balance data"
#> 
#> $input_data_path
#> [1] "/home/runner/OneDrive - University of Leeds/Fellowship 1960-2015 PFU database research/Input Data/CL-PFU Data/v3.0"
#> 
#> $output_data_path
#> [1] "/home/runner/OneDrive - University of Leeds/Fellowship 1960-2015 PFU database research/Output Data"
#> 
#> $schema_path
#> [1] "/home/runner/OneDrive - University of Leeds/Fellowship 1960-2015 PFU database research/Input Data/CL-PFU Data/v3.0/SchemaAndFKTables.xlsx"
#> 
#> $iea_data_path
#> [1] "/home/runner/OneDrive - University of Leeds/Fellowship 1960-2015 PFU database research/Input Data/External Data/IEA extended energy balance data/IEA 2022 energy balance data/IEA Extended Energy Balances 2022 (TJ).csv"
#> 
#> $fao_data_path
#> [1] "/home/runner/OneDrive - University of Leeds/Fellowship 1960-2015 PFU database research/Input Data/CL-PFU Data/v3.0/fao_qcl_data.rds"
#> 
#> $ilo_employment_data_path
#> [1] "/home/runner/OneDrive - University of Leeds/Fellowship 1960-2015 PFU database research/Input Data/CL-PFU Data/v3.0/ilo_employment_data.rds"
#> 
#> $ilo_working_hours_data_path
#> [1] "/home/runner/OneDrive - University of Leeds/Fellowship 1960-2015 PFU database research/Input Data/CL-PFU Data/v3.0/ilo_working_hours_data.rds"
#> 
#> $hmw_analysis_data_path
#> [1] "/home/runner/OneDrive - University of Leeds/Fellowship 1960-2015 PFU database research/Input Data/CL-PFU Data/v3.0/hmw_analysis_data.xlsx"
#> 
#> $amw_analysis_data_path
#> [1] "/home/runner/OneDrive - University of Leeds/Fellowship 1960-2015 PFU database research/Input Data/CL-PFU Data/v3.0/amw_analysis_data.xlsx"
#> 
#> $mw_concordance_path
#> [1] "/home/runner/OneDrive - University of Leeds/Fellowship 1960-2015 PFU database research/Input Data/CL-PFU Data/v3.0/FAO_ISO_MW_Mapping.xlsx"
#> 
#> $country_concordance_path
#> [1] "/home/runner/OneDrive - University of Leeds/Fellowship 1960-2015 PFU database research/Input Data/CL-PFU Data/v3.0/Country_Concordance_Full.xlsx"
#> 
#> $aggregation_mapping_path
#> [1] "/home/runner/OneDrive - University of Leeds/Fellowship 1960-2015 PFU database research/Input Data/CL-PFU Data/v3.0/aggregation_mapping.xlsx"
#> 
#> $exemplar_table_path
#> [1] "/home/runner/OneDrive - University of Leeds/Fellowship 1960-2015 PFU database research/Input Data/CL-PFU Data/v3.0/Exemplar_Table.xlsx"
#> 
#> $phi_constants_path
#> [1] "/home/runner/OneDrive - University of Leeds/Fellowship 1960-2015 PFU database research/Input Data/CL-PFU Data/v3.0/phi_constants.xlsx"
#> 
#> $fu_analysis_folder
#> [1] "/home/runner/OneDrive - University of Leeds/Fellowship 1960-2015 PFU database research/Input Data/CL-PFU Data/v3.0/FU allocation data"
#> 
#> $machine_data_folder
#> [1] "/home/runner/OneDrive - University of Leeds/Fellowship 1960-2015 PFU database research/Input Data/CL-PFU Data/v3.0/Machines - Data"
#> 
#> $ceda_data_folder
#> [1] "/home/runner/OneDrive - University of Leeds/Fellowship 1960-2015 PFU database research/Input Data/CL-PFU Data/v3.0/CEDA Data"
#> 
#> $exiobase_energy_flows_path
#> [1] "/home/runner/OneDrive - University of Leeds/Fellowship 1960-2015 PFU database research/Input Data/CL-PFU Data/v3.0/exiobase_energy_flows_concordance.xlsx"
#> 
#> $reports_source_folders
#> [1] "reports"
#> 
#> $reports_dest_folder
#> [1] "/home/runner/OneDrive - University of Leeds/Fellowship 1960-2015 PFU database research/Output Data/v3.0/Reports"
#> 
#> $pipeline_releases_folder
#> [1] "/home/runner/OneDrive - University of Leeds/Fellowship 1960-2015 PFU database research/Output Data/old_pins/PipelineReleases"
#> 
#> $versions_and_products_path
#> [1] "/home/runner/OneDrive - University of Leeds/Fellowship 1960-2015 PFU database research/Output Data/old_pins/PipelineReleases/versions and products.xlsx"
#> 
# Set relative paths with empty strings
get_abs_paths(home_path = "", cloud_storage_path = "",
              project_path = "my_project_path")
#> $home_path
#> [1] ""
#> 
#> $cloud_storage_path
#> [1] ""
#> 
#> $project_path
#> [1] "my_project_path"
#> 
#> $iea_folder_path
#> [1] "my_project_path/Input Data/External Data/IEA extended energy balance data/IEA 2022 energy balance data"
#> 
#> $input_data_path
#> [1] "my_project_path/Input Data/CL-PFU Data/v3.0"
#> 
#> $output_data_path
#> [1] "my_project_path/Output Data"
#> 
#> $schema_path
#> [1] "my_project_path/Input Data/CL-PFU Data/v3.0/SchemaAndFKTables.xlsx"
#> 
#> $iea_data_path
#> [1] "my_project_path/Input Data/External Data/IEA extended energy balance data/IEA 2022 energy balance data/IEA Extended Energy Balances 2022 (TJ).csv"
#> 
#> $fao_data_path
#> [1] "my_project_path/Input Data/CL-PFU Data/v3.0/fao_qcl_data.rds"
#> 
#> $ilo_employment_data_path
#> [1] "my_project_path/Input Data/CL-PFU Data/v3.0/ilo_employment_data.rds"
#> 
#> $ilo_working_hours_data_path
#> [1] "my_project_path/Input Data/CL-PFU Data/v3.0/ilo_working_hours_data.rds"
#> 
#> $hmw_analysis_data_path
#> [1] "my_project_path/Input Data/CL-PFU Data/v3.0/hmw_analysis_data.xlsx"
#> 
#> $amw_analysis_data_path
#> [1] "my_project_path/Input Data/CL-PFU Data/v3.0/amw_analysis_data.xlsx"
#> 
#> $mw_concordance_path
#> [1] "my_project_path/Input Data/CL-PFU Data/v3.0/FAO_ISO_MW_Mapping.xlsx"
#> 
#> $country_concordance_path
#> [1] "my_project_path/Input Data/CL-PFU Data/v3.0/Country_Concordance_Full.xlsx"
#> 
#> $aggregation_mapping_path
#> [1] "my_project_path/Input Data/CL-PFU Data/v3.0/aggregation_mapping.xlsx"
#> 
#> $exemplar_table_path
#> [1] "my_project_path/Input Data/CL-PFU Data/v3.0/Exemplar_Table.xlsx"
#> 
#> $phi_constants_path
#> [1] "my_project_path/Input Data/CL-PFU Data/v3.0/phi_constants.xlsx"
#> 
#> $fu_analysis_folder
#> [1] "my_project_path/Input Data/CL-PFU Data/v3.0/FU allocation data"
#> 
#> $machine_data_folder
#> [1] "my_project_path/Input Data/CL-PFU Data/v3.0/Machines - Data"
#> 
#> $ceda_data_folder
#> [1] "my_project_path/Input Data/CL-PFU Data/v3.0/CEDA Data"
#> 
#> $exiobase_energy_flows_path
#> [1] "my_project_path/Input Data/CL-PFU Data/v3.0/exiobase_energy_flows_concordance.xlsx"
#> 
#> $reports_source_folders
#> [1] "reports"
#> 
#> $reports_dest_folder
#> [1] "my_project_path/Output Data/v3.0/Reports"
#> 
#> $pipeline_releases_folder
#> [1] "my_project_path/Output Data/old_pins/PipelineReleases"
#> 
#> $versions_and_products_path
#> [1] "my_project_path/Output Data/old_pins/PipelineReleases/versions and products.xlsx"
#> 
```
