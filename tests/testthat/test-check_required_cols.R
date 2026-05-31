test_that("check_required_cols works", {
  dat <- data.frame(
    country = c("A", "B"),
    score = c(1, 2)
  )

  expect_equal(
    check_required_cols(dat, c("country", "score")),
    dat
  )

  expect_error(
    check_required_cols(dat, c("country", "missing_col")),
    "missing required column"
  )
})
