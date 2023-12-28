#' A generic plotting function
#'
#' ggplot2 styled plots for quick and easy plotting. Possible geoms are line, point, area and violin.
#' The function works in a ggplot workflow, so you can extend or override settings by adding ggplot2 "layers".
#'
#' @param dataframe Dataframe/tibble
#' @param x X axis element
#' @param y Y axis element
#' @param geom Type of plot, geom object
#' @param color Color for the geom object
#' @param fill Fill for the geom object
#' @param alpha Geom opacity
#' @param xlab X axis title
#' @param ylab Y lab title
#' @param theme Plot theme
#' @param title Plot title
#' @param subtitle Plot subtitle
#'
#' @return A ggplot2 object
#'
#' @import ggplot2
#'
#' @export
#'
#' @examples
#' test_data |>
#'   plot(
#'   geom = "line",
#'   x = elapsed_time_min,
#'   y = heart_rate,
#'   color = "red",
#'   alpha = 0.7
#'   )

plot <- function(
    dataframe,
    x = "x",
    y = "y",
    geom = "line",
    color = NULL,
    fill = NULL,
    alpha = 1,
    xlab = NULL,
    ylab = NULL,
    theme = "theme_light",
    title = NULL,
    subtitle = NULL
) {
  ggplot2::ggplot(
    data = dataframe,
    aes(
      x = {{ x }},
      y = {{ y }}
    )
  ) +
    switch(
      geom,
      line = ggplot2::geom_line(aes(color = color), show.legend = FALSE, alpha = alpha),
      point = ggplot2::geom_point(aes(color = color, fill = fill), show.legend = FALSE, alpha = alpha),
      bar = ggplot2::geom_bar(aes(color = color, fill = fill), show.legend = FALSE, alpha = alpha),
      area = ggplot2::geom_area(aes(color = color, fill = fill), show.legend = FALSE, alpha = alpha),
      violin = ggplot2::geom_violin(aes(color = color, fill = fill), show.legend = FALSE, alpha = alpha),
      default = ggplot2::geom_line(aes(color = color, fill = fill), show.legend = FALSE, alpha = alpha)
    ) +
    ggplot2::labs(
      x = xlab,
      y = ylab,
      title = title,
      subtitle = subtitle
    ) +
    switch(
      theme,
      "bw" = ggplot2::theme_bw(),
      "minimal" = ggplot2::theme_minimal(),
      "classic" = ggplot2::theme_classic(),
      "light" = ggplot2::theme_light(),
      default = ggplot2::theme_light()
    ) +
    scale_color_manual(values = color) +
    scale_fill_manual(values = fill) +
    ggplot2::theme(
      panel.grid.minor = ggplot2::element_blank()
    )
}




