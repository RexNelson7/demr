
#' This is the first function to graph violin plots of democracy score by level of representation.
#'
#' @importFrom ggplot2 ggplot aes geom_violin scale_fill_brewer labs theme_minimal theme
#'
#' @param level A string input to specify the level of representation
#'
#' @return A violin plot organized by continent
#' @export

plot_demscore <- function(level){
  if(level %in% c("High", "Moderate", "Low")) {
    p <- ggplot2::ggplot(
      load_data(),
      ggplot2::aes(
        x = .data$region,
        y = .data$spatial_democracy,
        fill = .data$region
      )) +
      ggplot2::geom_violin() +
      ggplot2::scale_fill_brewer(palette = "Dark2") +
      ggplot2::labs(
        title = "Spatial Democracy by Region",
        y = "Spatial Democracy",
        x = " ",
        fill = "Region"
      ) +
      theme_minimal() +
      theme(legend.position = "none")

    return(p)
  }
  return(NULL)
}




















