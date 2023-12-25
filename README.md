## traininganalyses

The purpose of `traininganalyses` is to ease the process of working with training data from Garmin and Strava.

### Installation

The latest version of `traininganalyses` is available from [GitHub](https://github.com/simenlokken/traininganalyses):

```{r}
devtools::install_github("simenlokken/traninganalyses")
```

### Test data

It exists a test data set from the authors personal [Strava](https://www.strava.com/activities/10377984627), a 45/15 x 10 x 3 interval progressing from the moderate to severe intensity domain. You can access data in the following way:

```{r}
test_data <- data(test_data)

test_data
```

### Using the functions

Here is an example of how to use the `prepare_garmin_data()` on the `test_data`:

```{r}
session <- prepare_garmin_data(test_data, max_hr = 195, body_weight = 75)
```
