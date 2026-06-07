#' Create a Democracy Index table
#'
#' Creates a formatted table of countries with the highest Democracy Index scores.
#'
#' @param democracy_index A data frame containing Democracy Index data.
#'   Defaults to `load_democracy_index()`.
#'
#' @return A formatted `knitr::kable` table.
#' @export
#'
#' @examples
#' democracy_index_table()
#' democracy_index_table(democracy_index = load_democracy_index())
democracy_index_table <- function(democracy_index = load_democracy_index()) {
  required_cols <- c(
    "Entity",
    "Year",
    "Democracy Index",
    "World region according to OWID"
  )

  missing_cols <- setdiff(required_cols, names(democracy_index))

  if (length(missing_cols) > 0) {
    stop(
      "missing required column: ",
      paste(missing_cols, collapse = ", "),
      call. = FALSE
    )
  }

  democracy_index |>
    dplyr::rename(
      country = .data$Entity,
      year = .data$Year,
      dem_index = .data$`Democracy Index`,
      region = .data$`World region according to OWID`
    ) |>
    dplyr::filter(.data$year > 2006, .data$year %% 5 == 0) |>
    dplyr::select(.data$country, .data$year, .data$dem_index, .data$region) |>
    dplyr::arrange(dplyr::desc(.data$dem_index)) |>
    dplyr::mutate(
      dem_index = round(.data$dem_index, 3)
    ) |>
    knitr::kable(
      col.names = c("Country", "Year", "Democracy Index", "Region"),
      caption = "Democracy Index summary for selected countries.",
      align = "c"
    )
}
