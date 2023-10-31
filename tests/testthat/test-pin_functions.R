test_that("get_pin_names() works as expected", {
  pin_versions <- pin_names(1.1)

  expect_equal(pin_versions$psut, "20230618T131003Z-4c70f")
  expect_equal(pin_versions$A, "20230618T131003Z-4c70f")
  expect_equal(pin_versions$psut_usa, "20230618T130939Z-50f39")
  expect_equal(pin_versions$B, "20230618T130939Z-50f39")
  expect_equal(pin_versions$eta_fu_Y_eiou, "20230527T005907Z-350b0")
  expect_equal(pin_versions$C, "20230527T005907Z-350b0")

})
