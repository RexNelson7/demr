#' Plot democracy score by representation type for one region
#'
#' Creates a scatterplot of population proportion against spatial democracy score
#' for a selected region.
#'
#' @param dat A data frame containing democracy data.
#' @param continent A character string giving the region to filter to.
#'
#' @return A ggplot object.
#' @export
plot_by_cont <- function(dat, continent) {
  check_required_cols(
    dat,
    c("region", "pop_prop_log", "spatial_democracy", "rep_type")
  )

  if (!is.character(continent) || length(continent) != 1) {
    stop("continent must be one character string.", call. = FALSE)
  }

  if (!continent %in% unique(dat$region)) {
    stop("continent must match one of the regions in the data.", call. = FALSE)
  }

  plot_dat <- dat |>
    dplyr::filter(.data$region == continent)

  ggplot2::ggplot(
    plot_dat,
    ggplot2::aes(
      x = .data$pop_prop_log,
      y = .data$spatial_democracy,
      color = .data$rep_type
    )
  ) +
    ggplot2::geom_point() +
    ggplot2::labs(
      title = paste("Democracy score by representation type in", continent),
      x = "Log population proportion",
      y = "Spatial democracy score",
      color = "Representation type"
    ) +
    ggplot2::theme_minimal()
}
