# Save the built-in dataset 'airquality' as a CSV file in the specified path
write.csv(airquality, file = "Lab1/IntroDataStructures/data/airquality.csv", row.names = FALSE)

# Read the CSV file back into R and store it in a variable called 'airquality_data'
airquality_data <- read.csv("Lab1/IntroDataStructures/data/airquality.csv")

# Display the first 6 rows of the dataset to preview the data
head(airquality_data)

# The dataset "airquality" contains:
# - Ozone: ozone concentration (ppb)
# - Solar.R: solar radiation (langley)
# - Wind: wind speed (mph)
# - Temp: temperature (°F)
# - Month: month (numeric; 5=May to 9=September)
# - Day: day of the month

# Display the structure of the dataset: variable names, types, and first few values
str(airquality_data)

# Show summary statistics for all columns (min, max, mean, median, etc.)
summary(airquality_data)

# Calculate the mean of the 'Temp' column, ignoring missing values (na.rm = TRUE)
mean(airquality_data$Temp, na.rm = TRUE)

# Calculate the median of the temperature column
median(airquality_data$Temp, na.rm = TRUE)

# Calculate the standard deviation of the temperature column
sd(airquality_data$Temp, na.rm = TRUE)

# Calculate the variance of the temperature column
var(airquality_data$Temp, na.rm = TRUE)

# Define a custom function to calculate standard deviation manually
my_sd <- function(x) {
  sqrt(var(x, na.rm = TRUE))  
}

# Use the custom standard deviation function on the temperature column
my_sd(airquality_data$Temp)

# Access and print the 2nd row of the dataset
airquality_data[2, ]

# Select only the 3rd column, keeping it as a data frame (drop = FALSE prevents conversion to a vector)
airquality_data[, 3, drop = FALSE]

# Select specific rows: 1, 2, and 4
airquality_data[c(1, 2, 4), ]

# Select a range of rows: from row 2 to row 6
airquality_data[2:6, ]

# Select all columns except the first two
airquality_data[, -c(1, 2)]

# Filter and display all rows where the temperature is greater than 90°F
airquality_data[airquality_data$Temp > 90, ]