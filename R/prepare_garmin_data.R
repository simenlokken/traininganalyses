#' Prepare Garmin session
#'
#'This function is used for cleaning and preparing a dataframe from a Garmin session.
#'It can be used directly on a .fit file converted to csv from the Java program RecordToCSV
#'for Garmin data (https://developer.garmin.com/fit/overview/).
#'
#'The main functionality is renaming of columns and creating new columns for normalized power and HR.
#'
#'@param dataframe Tibble/dataframe
#'@param max_hr Maximum heart rate
#'@param body_weight Body weight in kilograms
#'
#'@examples
#'
#'session <- prepare_garmin_session(session, max_hr = 200, body_weight = 80)
#'
#'@import dplyr
#'@import janitor
#'
#'@export

prepare_garmin_data <- function(dataframe, max_hr = 200, body_weight = 80) {
  dataframe <- dataframe |>
    janitor::clean_names() |>
    dplyr::rename(
      timestamp = record_timestamp_s,
      heart_rate = record_heart_rate_bpm,
      power = record_power_watts,
      distance = record_distance_m,
      altitude = record_altitude_m,
      cadence = record_cadence_rpm,
      longitude = record_position_long_semicircles,
      latitude = record_position_lat_semicircles
    ) |>
    dplyr::mutate(
      elapsed_time_sec = timestamp - min(timestamp),
      elapsed_time_min = elapsed_time_sec / 60,
      heart_rate_normalized = heart_rate / max_hr * 100,
      pwr_normalized = power / body_weight
    ) |>
    dplyr::select(
      timestamp, elapsed_time_sec, elapsed_time_min, heart_rate,
      heart_rate_normalized, power, pwr_normalized, cadence, distance,
      altitude, longitude, latitude
    ) |>
    dplyr::as_tibble()
}
