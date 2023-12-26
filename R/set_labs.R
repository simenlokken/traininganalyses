#' Set labs in a ggplot2 object
#'
#' The function must be passed TRUE/FALSE to time_sec argument, and TRUE/FALSE
#' to either pwr_norm or hr_norm
#'
#' @param pwr_norm If you want power in W/kg, set TRUE. If you want absolute power, set FALSE
#' @param hr_norm If heart rate in per cent of maximum, set TRUE. If you want in BPM, set FALSE
#' @param time_sec If you want time in seconds, set TRUE. If you want in minutes, set FALSE
#' @param title Title
#' @param subtitle subtitle
#'
#' @export

set_labs <- function(
    pwr_norm = NULL,
    hr_norm = NULL,
    time_sec = NULL,
    title = NULL,
    subtitle = NULL
    ) {
  if (!is.null(pwr_norm)) {
    if (pwr_norm == TRUE) {
      y <- "Power (W/kg)"
    } else {
      y <- "Power (W)"
    }
  }
  if (!is.null(hr_norm)) {
    if (hr_norm == TRUE) {
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

