
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
    p <- ggplot(
      load_data(),
      aes(x=region, y=spatial_democracy, fill = region)) +
      geom_violin() +
      scale_fill_brewer(palette = "Dark2") +
      labs(
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




















