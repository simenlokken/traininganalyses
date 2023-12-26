#' Set a ggplot2 theme
#'
#' This function is used for standardizing ggplot2 theme
#'
#' @export

set_theme <- function() {
  ggplot2::theme_light()
  ggplot2::theme(panel.grid.minor = element_blank())
}
