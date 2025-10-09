# Create a numeric vector with values from 2 to 4 and 9 to 13
x <- c(2:4, 9:13)
print(x) 

# Create a character vector
y <- c("b", "c", "E")
print(y) 

# Print the 5th element of vector x
print(x[5])

# Print the 2nd and 3rd elements of vector y
print(y[2:3])

# Print elements 2, 2, and 3 of vector y (element 2 is repeated)
print(y[c(2,2,3)])

# Attempt to print the 50th element of x – returns NA since it doesn't exist
print(x[50])

# Print vector x excluding the 5th element
print(x[-5])

# Print the 3rd element of x
print(x[3])

# Print elements 2, 2, and 5 to 7 of x
print(x[c(2,2,5:7)])

# Print vector x in reverse order (from 6th to 1st element)
print(x[6:1])

# Print vector x excluding the first 4 elements
print(x[-(1:4)])

# Print vector x excluding the 1st and 4th elements
print(x[-c(1,4)])