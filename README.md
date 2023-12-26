## traininganalyses

The purpose of `traininganalyses` is to ease the process of working with training data from Garmin and Strava.

### Installation

The latest version of `traininganalyses` is available from [GitHub](https://github.com/simenlokken/traininganalyses):

```{r}
devtools::install_github("simenlokken/traninganalyses")
```

### Garmin and Strava data

The functions in the package are to be used on data from Garmin and Strava. The Strava data is accessed through Strava's own API, see [Strava API](https://developers.strava.com/). The Garmin data is accessed through Garmin Connect, specifically the data you download as a .fit file. In order to transform the data to a .csv format, see [Garmin](https://developer.garmin.com/fit/overview/).

### Test data

There is a test data set in the package from the authors personal [Strava](https://www.strava.com/activities/10377984627). It is a 45/15 x 10 x 3 interval progressing from the moderate to severe intensity domain. You can access the data set in the following way:

```{r}
test_data <- data(test_data)
```

### Using the functions

Here is an example of how to use the `prepare_garmin_data()` on the `test_data`:

```{r}
session <- prepare_garmin_data(test_data, max_hr = 195, body_weight = 75)
```
