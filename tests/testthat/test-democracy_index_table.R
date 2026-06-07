test_that("democracy_index_table returns expected table", {
  dat <- load_democracy_index()

  result <- democracy_index_table(dat)

  expect_s3_class(result, "knitr_kable")
  expect_true(length(result) > 0)
})

test_that("democracy_index_table catches missing columns", {
  bad_dat <- data.frame(
    Entity = c("A", "B"),
    Year = c(2010, 2015),
    `Democracy Index` = c(8.1, 7.5),
    check.names = FALSE
  )

  expect_error(
    democracy_index_table(bad_dat),
    "missing required column"
  )
})
