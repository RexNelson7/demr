test_that("plot_by_cont returns a ggplot", {
  dat <- load_data()

  result <- plot_by_cont(dat, "Europe")

  expect_s3_class(result, "ggplot")
})

test_that("plot_by_cont catches bad inputs", {
  dat <- load_data()

  expect_error(
    plot_by_cont(dat, "NotARealRegion"),
    "continent must match"
  )

  expect_error(
    plot_by_cont(dat, c("Europe", "Americas")),
    "continent must be one character string"
  )
})
