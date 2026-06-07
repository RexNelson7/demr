#' Average democracy data by country
#'
#' Summarizes democracy and population representation data by country.
#'
#' @param dat A data frame containing democracy data.
#'
#' @return A tibble with one row per country and average values for democracy and representation variables.
#' @export
avg_table_country <- function(dat) {
  check_required_cols(
    dat,
    c("country", "spatial_democracy", "pop_prop", "pop_prop_log")
  )

  dat <- data.table::as.data.table(dat)
  data.table::setDF(dat)

  dat |>
    dplyr::group_by(.data$country) |>
    dplyr::summarise(
      avg_spatial_democracy = mean(.data$spatial_democracy, na.rm = TRUE),
      avg_pop_prop = mean(.data$pop_prop, na.rm = TRUE),
      avg_pop_prop_log = mean(.data$pop_prop_log, na.rm = TRUE),
      .groups = "drop"
    )
}
