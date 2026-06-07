test_that("anova_rep_type returns an ANOVA table", {
  dat <- data.frame(
    spatial_democracy = c(0.2, 0.4, 0.6, 0.7, 0.8, 0.9),
    rep_type = c("Low", "Low", "Moderate", "Moderate", "High", "High")
  )

  result <- anova_rep_type(dat)

  expect_s3_class(result, "data.frame")
  expect_true("Df" %in% names(result))
  expect_true("F value" %in% names(result))
  expect_true("Pr(>F)" %in% names(result))
})

test_that("anova_rep_type requires at least two representation groups", {
  dat <- data.frame(
    spatial_democracy = c(0.2, 0.4, 0.6),
    rep_type = c("Low", "Low", "Low")
  )

  expect_error(
    anova_rep_type(dat),
    "rep_type must contain at least two groups"
  )
})
