#' Generate Strava session
#'
#' This function creates a CSV file from a Strava session using Strava's own API.
#' It requires you have the API set up (see: https://developers.strava.com/).
#'
#' For using the function, you have to set your specific Strava information as environment variables.
#' API name must be called "STRAVA_API_NAME", client ID must be called "STRAVA_API_CLIENT_ID,
#' and the secret key must be called "STRAVA_API_SECRET_KEY".
#'
#' @param id ID from a given Strava session
#' @param resolution Resolution of the data, takes "low", "medium" or "high"
#'
#' @examples
#' session <- generate_strava_session(id = 1292913288, resolution = "high")
#'
#' @export

generate_strava_session <- function(id, resolution) {
  strava_token <- httr::config(
    token = strava_oauth(
      Sys.getenv("STRAVA_API_NAME"),
      Sys.getenv("STRAVA_API_CLIENT_ID"),
      Sys.getenv("STRAVA_API_SECRET_KEY"),
      app_scope = "activity:read_all",
      cache = TRUE)
  )
  my_acts <- get_activity_list(strava_token)
  dataframe <- get_activity_streams(
    my_acts,
    stoken = strava_token,
    id = id,
    resolution = resolution
  )
}
