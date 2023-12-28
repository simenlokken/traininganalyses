#' A generic plotting function
#'
#' ggplot2 styled plots for quick and easy plotting. Possible geoms are line, point, bar and area.
#'
#' @param dataframe The data you want to plot
#' @param x X axis element
#' @param y Y axis element
#' @param geom Type of plot, geom object
#' @param color Color for the geom object
#' @param fill Fill for the geom object
#' @param alpha Geom opacity
#' @param xlab X axis title
#' @param ylab Y lab title
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
    x,
    y,
    geom = "line",
    color = NULL,
    fill = NULL,
    alpha = NULL,
    xlab = NULL,
    ylab = NULL,
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
      line = ggplot2::geom_line(alpha = alpha, color = color),
      point = ggplot2::geom_point(alpha = alpha, color = color, fill = fill),
      bar = ggplot2::geom_bar(alpha = alpha, color = color, fill = fill),
      area = ggplot2::geom_area(alpha = alpha, fill = fill),
      default = ggplot2::geom_line(alpha = alpha, color = color, fill = fill)
    ) +
    ggplot2::labs(
      x = xlab,
      y = ylab,
      title = title,
      subtitle = subtitle
    ) +
    ggplot2::theme_bw() +
    ggplot2::theme(
      panel.grid.minor = ggplot2::element_blank()
    )
}



