# Save the Orange dataset to a CSV file
write.csv(Orange, file = "Lab2/CoreDataStructures/data/orange.csv", row.names = FALSE)

# Load the Orange dataset from the CSV file
orange_data <- read.csv("Lab2/CoreDataStructures/data/orange.csv")

# Display the first 15 rows of the dataset
head(orange_data, 15)

# Display the structure of the dataset
str(orange_data)

# Display summary statistics of the dataset
summary(orange_data)

# Select numeric variables 'age' and 'circumference'
vars <- orange_data[, c("age", "circumference")]
print(vars)

# Compute basic descriptive statistics
basic_stats <- data.frame(
  Mean = apply(vars, 2, mean, na.rm = TRUE),
  Median = apply(vars, 2, median, na.rm = TRUE),
  SD = apply(vars, 2, sd, na.rm = TRUE),
  Variance = apply(vars, 2, var, na.rm = TRUE),
  Min = apply(vars, 2, min, na.rm = TRUE),
  Max = apply(vars, 2, max, na.rm = TRUE)
)
print(basic_stats)

# Compute quartiles
quartiles <- apply(vars, 2, quantile, probs = c(0.25, 0.5, 0.75), na.rm = TRUE)
print(quartiles)

# Compute deciles
deciles <- apply(vars, 2, quantile, probs = seq(0.1, 0.9, by = 0.1), na.rm = TRUE)
print(deciles)