# Define a function named 'read_and_plot' that takes one parameter: file_path
read_and_plot <- function(file_path) {
  data <- read.table(file_path, header = FALSE)
  print("Data read from file:")
  print(data)
  plot(data[,1], data[,2], type = "b", col = "blue", pch = 19, xlab = "Column 1", ylab = "Column 2", main = "Plot from data.txt")
}

# Define the file path to the data file (relative path)
file_path <- "Lab1/IntroDataStructures/data/data.txt"

# Call the function to read the file and plot the data
read_and_plot(file_path)