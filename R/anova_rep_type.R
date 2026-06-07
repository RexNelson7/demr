#' Run ANOVA for democracy score by representation type
#'
#' Tests whether average spatial democracy scores differ across representation
#' types using a one-way ANOVA.
#'
#' @param dat A data frame containing democracy data.
#'
#' @return A data frame containing the ANOVA table.
#' @export
#'
#' @examples
#' dem_data <- load_data()
#' anova_rep_type(dem_data)
anova_rep_type <- function(dat) {
  check_required_cols(
    dat,
    c("spatial_democracy", "rep_type")
  )

  dat_clean <- dat |>
    dplyr::filter(
      !is.na(.data$spatial_democracy),
      !is.na(.data$rep_type)
    )

  if (dplyr::n_distinct(dat_clean$rep_type) < 2) {
    stop("rep_type must contain at least two groups.", call. = FALSE)
  }

  fit <- stats::aov(spatial_democracy ~ rep_type, data = dat_clean)

  as.data.frame(summary(fit)[[1]])
}
