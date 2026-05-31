test_that("avg_table_country returns expected summary", {
  dat <- load_data()

  result <- avg_table_country(dat)

  expect_s3_class(result, "tbl_df")

  expect_equal(
    names(result),
    c(
      "country",
      "avg_spatial_democracy",
      "avg_pop_prop",
      "avg_pop_prop_log"
    )
  )

  expect_true("Albania" %in% result$country)
  expect_true(nrow(result) > 0)
})

test_that("avg_table_country catches missing columns", {
  bad_dat <- data.frame(
    country = c("A", "B"),
    spatial_democracy = c(0.5, 0.7)
  )

  expect_error(
    avg_table_country(bad_dat),
    "missing required column"
  )
})
