# Create a matrix with character values
A <- matrix(c("8", "16", "9", "2"), nrow = 2, byrow = TRUE)
print(A) 

# Convert the character matrix to a numeric matrix
numeric_A <- matrix(as.numeric(A), nrow=2)
print(numeric_A)