
test_that("get_abs_paths() works as expected", {
  paths <- get_abs_paths()

  # Dropbox path
  expect_true(endsWith(paths$cloud_storage_path, "Dropbox"))

  # Project path
  expect_true(endsWith(paths$project_path, "Fellowship 1960-2015 PFU database"))

  # IEA folder path
  expect_true(endsWith(paths$iea_folder_path, file.path("IEA extended energy balance data", "IEA 2022 energy balance data")))

  # IEA data path
  expect_true(endsWith(paths$iea_data_path, file.path(paths$iea_folder_path, "IEA Extended Energy Balances 2022 (TJ).csv")))

  # FAO data path
  expect_true(endsWith(paths$fao_data_path, "fao_qcl_data.rds"))

  # ILO working hours data path
  expect_true(endsWith(paths$ilo_working_hours_data_path, "ilo_working_hours_data.rds"))

  # ILO employment data path
  expect_true(endsWith(paths$ilo_employment_data_path, "ilo_employment_data.rds"))

  # Human muscle work analysis data path
  expect_true(endsWith(paths$hmw_analysis_data_path, "hmw_analysis_data.xlsx"))

  # Animal muscle work analysis data path
  expect_true(endsWith(paths$amw_analysis_data_path, "amw_analysis_data.xlsx"))

  # Muscle work country concordance data path
  expect_true(endsWith(paths$mw_concordance_path, "FAO_ISO_MW_Mapping.xlsx"))

  # Country concordance path
  expect_true(endsWith(paths$country_concordance_path, "Country_Concordance_Full.xlsx"))

  # Aggregation mapping path
  expect_true(endsWith(paths$aggregation_mapping_path, "aggregation_mapping.xlsx"))

  # exemplar table path
  expect_true(endsWith(paths$exemplar_table_path, "Exemplar_Table.xlsx"))

  # phi constants table path
  expect_true(endsWith(paths$phi_constants_path, "phi_constants.xlsx"))

  # FU analysis folder
  expect_true(endsWith(paths$fu_analysis_folder, "FU analysis data"))

  # Machine data folder
  expect_true(endsWith(paths$machine_data_folder, "Machines - Data"))

  # CEDA data folder
  expect_true(endsWith(paths$ceda_data_folder, "CEDA Data"))

  # Report source folder
  expect_true(endsWith(paths$reports_source_folders, "reports"))

  # Report destination folder
  expect_true(endsWith(paths$reports_dest_folder, "Reports"))

  # exiobase file path
  expect_true(endsWith(paths$exiobase_energy_flows_path, "exiobase_energy_flows_concordance.xlsx"))

  # Workflow output folder
  expect_true(endsWith(paths$pipeline_caches_folder, "PipelineCaches"))

  # Workflow releases folder
  expect_true(endsWith(paths$pipeline_releases_folder, "PipelineReleases"))
})


test_that("Files exist", {
  # Don't run this test on continuous integration systems
  # which are unlikely to have access to the folders.
  testthat::skip_on_ci()

  paths <- get_abs_paths()

  # Home path
  expect_true(file.exists(paths$home_path))

  # Dropbox path
  expect_true(file.exists(paths$cloud_storage_path))

  # Project path
  expect_true(file.exists(paths$project_path))

  # IEA folder path
  expect_true(file.exists(paths$iea_folder_path))

  # IEA data path
  expect_true(file.exists(paths$iea_data_path))

  # Country concordance path
  expect_true(file.exists(paths$country_concordance_path))

  # Aggregation mapping path
  expect_true(file.exists(paths$aggregation_mapping_path))

  # exemplar table path
  expect_true(file.exists(paths$exemplar_table_path))

  # phi constants table path
  expect_true(file.exists(paths$phi_constants_path))

  # FU analysis folder
  expect_true(file.exists(paths$fu_analysis_folder))

  # Machine data folder
  expect_true(file.exists(paths$machine_data_folder))

  # CEDA data folder
  expect_true(file.exists(paths$ceda_data_folder))

  # Exiobase data folder
  expect_true(file.exists(paths$exiobase_energy_flows_path))

  # Report destination folder
  expect_true(file.exists(paths$reports_dest_folder))

  # Drake cache folder
  # expect_true(file.exists(paths$drake_cache_folder))

  # Report workflow output folder
  expect_true(file.exists(paths$pipeline_caches_folder))

  # Report workflow releases folder
  expect_true(file.exists(paths$pipeline_releases_folder))
})


test_that("get_abs_paths() works with empty strings for home_path and cloud_storage_path", {
  version <- "this_version"
  iea_year <- "iea_year"
  paths <- get_abs_paths(home_path = "",
                         cloud_storage_path = "",
                         project_path = "p_path",
                         version = version,
                         iea_year = iea_year)

  expect_equal(paths$home_path, "")
  expect_equal(paths$cloud_storage_path, "")
  expect_equal(paths$project_path, "p_path")
  expect_equal(paths$iea_folder_path, file.path("p_path", "IEA extended energy balance data",
                                                paste("IEA", iea_year, "energy balance data")))
  expect_equal(paths$input_data_path, file.path("p_path", "InputData", version))
  expect_equal(paths$output_data_path, file.path("p_path", "OutputData"))
  expect_equal(paths$iea_data_path, file.path(paths$iea_folder_path,
                                              paste("IEA Extended Energy Balances", "iea_year", "(TJ).csv")))
  expect_equal(paths$fao_data_path, file.path(paths$input_data_path, "fao_qcl_data.rds"))
  expect_equal(paths$ilo_employment_data_path, file.path(paths$input_data_path, "ilo_employment_data.rds"))
  expect_equal(paths$ilo_working_hours_data_path, file.path(paths$input_data_path, "ilo_working_hours_data.rds"))
  expect_equal(paths$hmw_analysis_data_path, file.path(paths$input_data_path,
                                                       "hmw_analysis_data.xlsx"))
  expect_equal(paths$amw_analysis_data_path, file.path(paths$input_data_path,
                                                       "amw_analysis_data.xlsx"))
  expect_equal(paths$country_concordance_path, file.path(paths$input_data_path,
                                                       "Country_Concordance_Full.xlsx"))
  expect_equal(paths$aggregation_mapping_path, file.path(paths$input_data_path,
                                                         "aggregation_mapping.xlsx"))
  expect_equal(paths$exemplar_table_path, file.path(paths$input_data_path,
                                                    "Exemplar_Table.xlsx"))
  expect_equal(paths$fu_analysis_folder, file.path(paths$input_data_path,
                                                   "FU analysis data"))
  expect_equal(paths$ceda_data_folder, file.path(paths$input_data_path,
                                                 "CEDA Data"))
  expect_equal(paths$machine_data_folder, file.path(paths$input_data_path,
                                                    "Machines - Data"))
  expect_equal(paths$reports_source_folders, "reports")
  expect_equal(paths$reports_dest_folder, file.path(paths$output_data_path, "Reports"))
  expect_equal(paths$pipeline_caches_folder, file.path(paths$output_data_path, "PipelineCaches"))
  expect_equal(paths$pipeline_releases_folder, file.path(paths$output_data_path, "PipelineReleases"))
})


