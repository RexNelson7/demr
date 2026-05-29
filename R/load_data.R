library(roxygen2)

#' This is the first function to load our data.
#'
#' @importFrom readr read_csv
#'
#'
#' @return A data frame from dem_data.csv
#'
#' @export

load_data <- function(){
  demdata <- read_csv("dem_data.csv")
}

























