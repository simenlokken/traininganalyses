#' Set labs in a ggplot2 object
#'
#' The function must be passed TRUE/FALSE to time_sec argument, and TRUE/FALSE
#' to either pwr_per_kg or hr_per_cent
#'
#' @param pwr_per_kg If you want power in W/kg, set TRUE. If you want absolute power, set FALSE
#' @param hr_per_cent If heart rate in per cent of maximum, set TRUE. If you want in BPM, set FALSE
#' @param time_sec If you want time in seconds, set TRUE. If you want minutes, set FALSE
#' @param title Title
#' @param subtitle subtitle
#'
#' @import ggplot2
#'
#' @export

set_labs <- function(
    pwr_per_kg = NULL,
    hr_per_cent = NULL,
    time_sec = NULL,
    title = NULL,
    subtitle = NULL
    ) {
  if (!is.null(pwr_per_kg)) {
    if (pwr_per_kg == TRUE) {
      y <- "Power (W/kg)"
    } else {
      y <- "Power (W)"
    }
  }
  if (!is.null(hr_per_cent)) {
    if (hr_per_cent == TRUE) {
      y <- "Heart rate (% of maximum)"
    } else {
      y <- "Heart rate (BPM)"
    }
  }
  if (!is.null(time_sec)) {
    if (time_sec == TRUE) {
      x <- "Time (seconds)"
    } else {
      x <- "Time (minutes)"
    }
  }
  ggplot2::labs(
    title = title,
    subtitle = subtitle,
    x = x,
    y = y
    )
}

