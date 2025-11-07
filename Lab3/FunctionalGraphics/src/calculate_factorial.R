# Create a function to calculate factorial using for loop
factorial_for <- function(n) {
    fact <- 1
    for (i in 1:n) {
        fact <- fact * i
    }
    return(fact)
}

# Create a function to calculate factorial using prod()
factorial_prod <- function(n) {
    return (prod(1:n))
}

# Create number to calculate factorial
number <- 5

# Print the results of both functions
print(factorial_for(number))
print(factorial_prod(number))