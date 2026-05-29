test_that("plot dem score works", {
  dat <- load_data()

  plot_dem_high <- plot_demscore("High")
  plot_dem_mod <- plot_demscore("Moderate")
  plot_dem_low <- plot_demscore("Low")
  plot_na <- plot_demscore("Pickles")

  expect_s3_class(plot_dem_high, "ggplot")
  expect_s3_class(plot_dem_mod, "ggplot")
  expect_s3_class(plot_dem_low, "ggplot")
  expect_equal(plot_na, NULL)
})



