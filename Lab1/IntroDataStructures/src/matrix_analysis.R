# Create a 4x4 matrix 'y' filled by rows with the given numbers
y <- matrix(c(1, 2, 3, 5, 10, 12, 13, 22, 5, 9, 8, 34, 7, 1, 4, 3), nrow = 4, byrow = TRUE)
print(y) 

# Print the element in the 3rd row, 2nd column
print("Element at 3rd row, 2nd column:")
print(y[3, 2])

# Print the entire second row
print("Second row of Y:")
print(y[2, ])

# Print the entire fourth column
print("Fourth column of Y:")
print(y[, 4])

# Print the matrix after removing the 1st row and 2nd column
print("Matrix after removing 1st row and 2nd column:")
print(y[-1, -2])

# Export the matrix 'y' to a text file (without row and column names)
write.table(y, file = "Lab1/IntroDataStructures/data/data.txt", row.names = FALSE, col.names = FALSE)
print("Matrix Y exported to data/data.txt")