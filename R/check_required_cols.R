#' Check required columns
#'
#' Checks whether a data frame contains all required columns.
#'
#' @param dat A data frame.
#' @param cols A character vector of required column names.
#'
#' @return The original data frame if all required columns are present.
#' @keywords internal
check_required_cols <- function(dat, cols) {
  missing_cols <- setdiff(cols, names(dat))

  if (length(missing_cols) > 0) {
    stop(
      "The data is missing required column(s): ",
      paste(missing_cols, collapse = ", "),
      call. = FALSE
    )
  }

  dat
}
