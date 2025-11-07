# Create the 'person' data frame
person <- data.frame(height = c(160, 180, 175), weight = c(52, 96, 60), age = c(18, 43, 29), c.eyes = c("green", "blue", "blue"))
print(person)

# Rename the 3rd column to 'new.age'
colnames(person)[3] <- "new.age"
print(person)

# Rename the 2nd row to 'Mary'
rownames(person)[2] <- "Mary"
print(person)

# Remove row names
rownames(person) <- NULL
print(person)

# Rename all columns to 'a', 'b', 'c', 'd'
colnames(person) <- c("a", "b", "c", "d")
print(person)

# Access a single element (1st row, 3rd column)
element <- person[1, 3]
print(element)

# Access a row (2nd row) as a data frame
var_df <- person[ , 2, drop = FALSE] 
print(var_df)

# Access a column (2nd column) as a vector
var_vec <- person[ , 2] 
print(var_vec)  

# Access multiple elements (1st and 3rd rows, 3rd column)
elem_var <- person[c(1,3), 3]
print(elem_var)

# Filter heights between 160 and 180
height_filtered <- person$a[person$a > 160 & person$a < 180]
print(height_filtered)

# Filter weights for heights greater than 170
weight_filtered <- person$b[person$a > 170]
print(weight_filtered)

# Get all persons with weight greater than 52
persons_weight <- person[person$b > 52, ]
print(persons_weight)

# Update the heights of the first two persons
person$a[1:2] <- c(190, 158)
print(person)