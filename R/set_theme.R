#' Set a ggplot2 theme
#'
#' This function is used for standardazing some elements of a ggplot2.
#'
#' @export

set_theme <- function() {
  ggplot2::theme_bw()
  ggplot2::theme(
    panel.grid.minor = element_blank()
  )
}
