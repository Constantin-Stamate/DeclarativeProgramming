# Load tidyverse for data manipulation
library("tidyverse")

# Create CSV file from pressure dataset
write.csv(pressure, file = "Lab3/FunctionalGraphics/data/pressure.csv", row.names = FALSE)

# Read the CSV file into a data frame
pressure_data <- read.csv("Lab3/FunctionalGraphics/data/pressure.csv")

# Display the first 15 rows of the dataset
head(pressure_data, 15)

# Display the structure of the dataset
str(pressure_data)

# Display summary statistics of the dataset
summary(pressure_data)

# Create mean of temperature
mean(pressure_data$temperature, na.rm = TRUE)

# Create median of temperature
median(pressure_data$temperature, na.rm = TRUE)

# Create standard deviation of temperature
sd(pressure_data$temperature, na.rm = TRUE)

# Create variance of temperature
var(pressure_data$temperature, na.rm = TRUE)

# Create filtered data with temperature > 100
pressure_filtered <- pressure_data %>% filter(temperature > 100)
print(pressure_filtered)

# Create mutated data adding pressure in kPa
pressure_mutated <- pressure_filtered %>% mutate(pressure_kPa = pressure * 0.1333)
print(pressure_mutated)

# Arrange data by pressure
pressure_arranged <- pressure_mutated %>% arrange(pressure)
print(pressure_arranged)

# Transmute to keep only temperature and new pressure in kPa
pressure_transmuted <- pressure_mutated %>% transmute(temp_C = temperature, pressure_kPa = pressure * 0.1333, pressure_mmHg = pressure)
print(pressure_transmuted)

# Rename temperature column
pressure_renamed <- pressure_arranged %>% rename(temp_C = temperature)
print(pressure_renamed)

# Select only temperature and pressure columns
pressure_selected <- pressure_renamed %>% select(temp_C, pressure)
print(pressure_selected)

# Get distinct rows
pressure_distinct <- pressure_selected %>% distinct()
print(pressure_distinct)