test_that("pin_versions() works as expected", {

  testthat::skip_on_ci()

  # Test the pathological case
  expect_error(pin_versions("bogus"), "Unknown database version: bogus")

  # Test a real case
  pin_vs <- pin_versions(1.1)

  expect_equal(pin_vs$psut, "20230618T131003Z-4c70f")
  expect_equal(pin_vs$A, "20230618T131003Z-4c70f")
  expect_equal(pin_vs$psut_usa, "20230618T130939Z-50f39")
  expect_equal(pin_vs$B, "20230618T130939Z-50f39")
  expect_equal(pin_vs$eta_fu_Y_eiou, "20230527T005907Z-350b0")
  expect_equal(pin_vs$C, "20230527T005907Z-350b0")

  expect_equal(pin_vs$sector_agg_eta_fu, "20230619T051454Z-e0f57")
  expect_equal(pin_vs$`Agg-A`, "20230619T051454Z-e0f57")
  expect_equal(pin_vs$sector_agg_eta_fu_csv, "20230621T172335Z-aca06")
  expect_equal(pin_vs$`Agg-B`, "20230621T172335Z-aca06")
  expect_equal(pin_vs$agg_eta_pfu, "20230619T051304Z-f653c")
  expect_equal(pin_vs$`Agg-C`, "20230619T051304Z-f653c")
  expect_equal(pin_vs$agg_eta_pfu_csv, "20230621T172311Z-d4cbf")
  expect_equal(pin_vs$`Agg-D`, "20230621T172311Z-d4cbf")
  expect_equal(pin_vs$psut_re_all_chop_all_ds_all_gr_all, "20230621T124407Z-c5f3c")
  expect_equal(pin_vs$`Agg-E`, "20230621T124407Z-c5f3c")

})


test_that("read_pin_version() works as expected", {

  testthat::skip_on_ci()

  phi_vecs <- read_pin_version(pin_name = "phi_vecs", database_version = 1.2)
  expect_equal(names(phi_vecs), c("Country", "Year", "phi"))
})
