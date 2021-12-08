test_that("correct output", {
  expect_equal((class(load_expression(Patient_data))), SingleCellExperiment)
})
