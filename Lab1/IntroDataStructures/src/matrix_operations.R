# Create a vector from 1 to 10
vector <- 1:10
print(vector)  

# Create a matrix with 2 columns from the vector (filled column-wise by default)
matrice1 <- matrix(vector, ncol = 2)
print(matrice1)

# Create a 2-row matrix filled by row
matrice2 <- matrix(1:10, nrow = 2, byrow = TRUE)
print(matrice2)

# Create a 3x3 matrix (will recycle values since vector length is 4)
m <- matrix(1:4, nrow = 3, ncol = 3)
print(m)

# Reprint matrice2
print(matrice2)

# Dimensions of matrice1
print(dim(matrice1)) 
print(ncol(matrice1)) 
print(nrow(matrice1)) 

# Matrix multiplication
resultat <- matrice1 %*% matrice2
print(resultat) 

# Transpose of matrice1
transpose_matrice1 <- t(matrice1)
print(transpose_matrice1)  

# Diagonal elements of 'resultat'
diag_result <- diag(resultat)
print(diag_result)  

# Create a diagonal matrix with specified values
diag_matrix <- diag(c(3, 2, 4))
print(diag_matrix) 

# Combine vectors as rows
vecteur1 <- c(8, 3, 2)  
vecteur2 <- c(23, 6, 9)
res <- rbind(vecteur1, vecteur2)  
print(res)

# Combine matrices/vectors as columns
vecteur3 <- c(2, 4)
combined_matrix <- cbind(res, vecteur3)
print(combined_matrix)

# Eigenvalues and eigenvectors of 'resultat'
eigen_result <- eigen(resultat)
print(eigen_result$values)  
print(eigen_result$vectors)

# Accessing specific rows and columns
print(resultat[1, ])          
print(resultat[, c(2, 2, 1)]) 
print(resultat[-1, ])        
print(resultat[1:2, -1])      
print(resultat[resultat > 51]) 

# Creating matrices from vector
print(matrix(vector, nrow = 2))           
print(matrix(vector, nrow = 2, byrow = TRUE))