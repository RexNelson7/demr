#' Load democracy data
#'
#' Loads the democracy data used in the demr package.
#'
#' @return A tibble containing country-level democracy and representation data.
#' @export
load_data <- function() {
  data_path <- system.file("extdata", "dem_data.csv", package = "demr")

  if (data_path == "") {
    stop("Could not find dem_data.csv in inst/extdata.", call. = FALSE)
  }

  readr::read_csv(data_path, show_col_types = FALSE)
}


#' Load Democracy Index data
#'
#' Loads the Economist Intelligence Unit Democracy Index data used in the demr package.
#'
#' @return A tibble containing Democracy Index scores by country and year.
#' @export
load_democracy_index <- function() {
  data_path <- system.file("extdata", "democracy-index-eiu.csv", package = "demr")

  if (data_path == "") {
    stop("Could not find democracy-index-eiu.csv in inst/extdata.", call. = FALSE)
  }

  readr::read_csv(data_path, show_col_types = FALSE)
}




















