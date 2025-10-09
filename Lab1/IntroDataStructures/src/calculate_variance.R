# Define a custom function called 'my_variance' that calculates the variance of a vector v
my_variance <- function(v) {
  m <- mean(v)
  squared_diff <- (v - m)^2
  return(sum(squared_diff) / (length(v) - 1))
}

# Create a numeric vector 'x'
x <- c(2, 4, 6, 8, 10)

# Print the result of the custom variance function
print(my_variance(x))  

# Print the result using R’s built-in 'var()' function for comparison
print(var(x))