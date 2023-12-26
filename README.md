## traininganalyses

The purpose of `traininganalyses` is to ease the process of working with training data from Garmin and Strava.

For using the Strava functions, it requires you have an API set up. More information in the **Garmin and Strava data** subsection.

The Garmin functions can be used on your own (or others) Garmin data as long as you have downloaded it from Garmin Connect and converted the .fit file to a .csv file. More information in the **Garmin and Strava data** subsection.

### Installation

Version 0.1.0 of `traininganalyses` is available on this [GitHub](https://github.com/simenlokken/traininganalyses), and can be downloaded using the following code:

```{r}
devtools::install_github("simenlokken/traininganalyses")
```

### Garmin and Strava data

The Strava data is accessed through Strava's own API, see [Strava API](https://developers.strava.com/). The Garmin data is accessed through Garmin Connect, specifically the data you download as a .fit file. In order to transform the data to a .csv format, see [Garmin](https://developer.garmin.com/fit/overview/). It is fairly easy to access data using both methods, and I recommend to use YouTube in addition to Garmin and Strava's own documentation if you are stuck.

### Test data

There is a test data set in the package from the authors personal [Strava](https://www.strava.com/activities/10377984627). It is a 45/15 x 10 x 3 interval progressing from the moderate to severe intensity domain. The data set can be accessed directly by calling it:

```{r}
test_data
```

### Using the functions

Here is an example of how to use `prepare_garmin_data()` function on `test_data`:

```{r}
session <- prepare_garmin_data(test_data, max_hr = 195, body_weight = 75)
```

### Bugs

If you experience any issues, have an idea to a new function, or something you would like to improve, feel free to reach out.
