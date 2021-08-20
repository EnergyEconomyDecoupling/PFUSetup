
test_that("get_abs_paths() works as expected", {
  paths <- get_abs_paths()

  # Dropbox path
  expect_true(endsWith(paths$dropbox_path, "Dropbox"))

  # Project path
  expect_true(endsWith(paths$project_path, "Fellowship 1960-2015 PFU database"))

  # IEA folder path
  expect_true(endsWith(paths$iea_folder_path, file.path("IEA extended energy balance data", "IEA 2019 energy balance data")))

  # IEA data path
  expect_true(endsWith(paths$iea_data_path, file.path(paths$iea_folder_path, "IEA Extended Energy Balances 2019.csv")))

  # Country concordance path
  expect_true(endsWith(paths$country_concordance_path, file.path("Mapping", "Country_Concordance_Full.xlsx")))

  # exemplar table path
  expect_true(endsWith(paths$exemplar_table_path, file.path("Database plan", "Exemplar_Table.xlsx")))

  # FU analysis folder
  expect_true(endsWith(paths$fu_analysis_folder, "Country-level exergy accounting data"))

  # Machine data folder
  expect_true(endsWith(paths$machine_data_folder, "Machines - Data"))

  # CEDA data folder
  expect_true(endsWith(paths$ceda_data_folder, "CEDA Data"))

  # Report source folder
  expect_true(endsWith(paths$reports_source_folders, "reports"))

  # Report destination folder
  expect_true(endsWith(paths$reports_dest_folder, "Reports"))

  # Drake cache folder
  expect_true(endsWith(paths$drake_cache_folder, ".drake"))
})


test_that("Files exist", {
  # Don't run this test on continuous integration systems
  # which are unlikely to have access to the folders.
  testthat::skip_on_ci()

  paths <- get_abs_paths(drake_cache_folder = testthat::test_path("..", "..", "..", "PFU-Database", ".drake"))

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

  # exemplar table path
  expect_true(file.exists(paths$exemplar_table_path))

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
})
