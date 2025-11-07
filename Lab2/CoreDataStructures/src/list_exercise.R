# Create a list with different data types
my_list <- list(5, c(160, 180, 175), matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12), nrow = 4, byrow = FALSE), data.frame(height = c(160, 180, 175), weight = c(52, 96, 60), age = c(18, 43, 29), c.eyes = c("green", "blue", "blue")))
print(my_list)

# Assign names to the list elements
names(my_list) <- c("single_value", "vector_values", "matrix_values", "person_df")
print(my_list)

# Access the second element as a vector
second_element_vector <- my_list[[2]]  
print(second_element_vector)

# Access the second element as a list
second_element_list <- my_list[2]  
print(second_element_list)  

# Access multiple elements (1st and 3rd) from the list
elements <- my_list[c(1,3)]
print(elements)

# Access the element in the 3rd row and 2nd column of the data frame
third_element <- my_list[[4]][3, 2]
print(third_element)