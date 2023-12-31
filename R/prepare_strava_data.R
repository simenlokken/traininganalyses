#' Prepare Strava session
#'
#' This function is the equivalent of prepare_garmin_data for data generated
#' using the Strava API.
#'
#' Type "?prepare_garmin_session" in the R console for more information.
#'
#' @param dataframe Tibble/dataframe
#' @param max_hr Maximum heart rate (BPM)
#' @param bw Body weight in kilograms
#'
#' @examples
#' session <- prepare_garmin_session(session, max_hr = 200, bw = 80)
#'
#' @import dplyr
#'
#' @export

prepare_strava_data <- function(dataframe, max_hr = 200, bw = 80) {
  dataframe <- dataframe |>
    dplyr::rename(
      heart_rate = heartrate,
      power = watts,
      elapsed_time_sec = time,
      speed = velocity_smooth,
      grade = grade_smooth,
      latitude = lat,
      longitude = lng
    ) |>
    dplyr::mutate(
      hr_per_cent_max = heart_rate / max_hr * 100,
      pwr_per_kg = power / bw,
      elapsed_time_min = elapsed_time_sec / 60
    ) |>
    dplyr::select(
      elapsed_time_sec, elapsed_time_min, heart_rate, hr_per_cent_max,
      power, pwr_per_kg, distance, cadence, speed, altitude, grade,
      latitude, longitude
    ) |>
    dplyr::as_tibble()
}
