# Create CSV file from Orange dataset
write.csv(Orange, file = "Lab3/FunctionalGraphics/data/orange.csv", row.names = FALSE)

# Create data frame by reading the CSV file
orange_data <- read.csv("Lab3/FunctionalGraphics/data/orange.csv")

# Display the first 15 rows of the data frame
head(orange_data, 15)

# Create scatter plot of circumference versus age
plot(orange_data$age, orange_data$circumference, pch = 25, col.main = "blue", main = "Dependence of Circumference on Age", sub = "Exercise 4 - Lab 3", xlab = "Age (days)", ylab = "Circumference (mm)", col = "green")                      