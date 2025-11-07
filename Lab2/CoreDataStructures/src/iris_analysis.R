# Save the iris dataset to a CSV file
write.csv(iris, file = "Lab2/CoreDataStructures/data/iris.csv", row.names = FALSE)

# Read the iris dataset from the CSV file
iris_data <- read.csv("Lab2/CoreDataStructures/data/iris.csv")

# Display the first 7 rows of the dataset 
head(iris_data, 7)

# Filter the dataset for species "versicolor"
new.iris <- subset(iris_data, Species == "versicolor")

# Sort the filtered dataset by Sepal.Length in descending order
new.iris <- new.iris[order(new.iris$Sepal.Length, decreasing = TRUE), ]
print(new.iris)