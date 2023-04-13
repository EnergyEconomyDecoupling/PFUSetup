
test_that("get_abs_paths() works as expected", {
  paths <- get_abs_paths()

  # Dropbox path
  expect_true(endsWith(paths$dropbox_path, "Dropbox"))

  # Project path
  expect_true(endsWith(paths$project_path, "Fellowship 1960-2015 PFU database"))

  # IEA folder path
  expect_true(endsWith(paths$iea_folder_path, file.path("IEA extended energy balance data", "IEA 2021 energy balance data")))

  # IEA data path
  expect_true(endsWith(paths$iea_data_path, file.path(paths$iea_folder_path, "IEA Extended Energy Balances 2021 (TJ).csv")))

  # Muscle work directory path
  expect_true(endsWith(paths$mw_data_path, "Muscle Work - Data"))

  # FAO data path
  expect_true(endsWith(paths$fao_data_path, "fao_qcl_data.rds"))

  # ILO data path
  expect_true(endsWith(paths$ilo_data_path, "ilo_hmw_data.rds"))

  # Human muscle work analysis data path
  expect_true(endsWith(paths$hmw_analysis_data_path, "hmw_analysis_data.xlsx"))

  # Animal muscle work analysis data path
  expect_true(endsWith(paths$amw_analysis_data_path, "amw_analysis_data.xlsx"))

  # Muscle work country concordance data path
  expect_true(endsWith(paths$mw_concordance_path, "FAO_ISO_MW_Mapping.xlsx"))

  # Country concordance path
  expect_true(endsWith(paths$country_concordance_path, file.path("Mapping", "Country_Concordance_Full.xlsx")))

  # Aggregation mapping path
  expect_true(endsWith(paths$aggregation_mapping_path, file.path("Mapping", "aggregation_mapping.xlsx")))

  # exemplar table path
  expect_true(endsWith(paths$exemplar_table_path, file.path("Mapping", "Exemplar_Table.xlsx")))

  # phi constants table path
  expect_true(endsWith(paths$phi_constants_path, file.path("Phi - Data", "phi_constants.xlsx")))

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
  expect_true(file.exists(paths$dropbox_path))

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

  # Report destination folder
  expect_true(file.exists(paths$reports_dest_folder))

  # Drake cache folder
  # expect_true(file.exists(paths$drake_cache_folder))

  # Report workflow output folder
  expect_true(file.exists(paths$pipeline_caches_folder))

  # Report workflow releases folder
  expect_true(file.exists(paths$pipeline_releases_folder))
})
