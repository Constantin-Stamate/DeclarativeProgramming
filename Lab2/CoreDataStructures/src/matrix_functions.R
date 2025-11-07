# Create a 4x4 matrix Y with specified values
Y <- matrix(c(1, 0, 3, 4, 6, 6, 0, 4, 5, 6, 2, 3, 0, 1, 2, 4), nrow=4, ncol=4, byrow=FALSE)

# Assign row and column names
rownames(Y) <- c("row-1", "row-2", "row-3", "row-4")
colnames(Y) <- c("column 1", "column 2", "column 3", "column 4")
print(Y)

# Calculate the determinant of Y
det_Y <- det(Y)
print(det_Y)

# Calculate the inverse of Y if it is invertible
if(det_Y != 0){
  inv_Y <- solve(Y)
  print(inv_Y)
} else {
  print("The matrix is not invertible")
}