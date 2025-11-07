# Define a function to calculate the mean with precision up to 4 decimal places
calc_mean_precision <- function(vec) {
    if (!is.numeric(vec)) {
        print("Input must be a numeric vector")
        return(NULL)
    }

    mean_value <- mean(vec)
    mean_value <- trunc(mean_value * 10000) / 10000
    return(mean_value)
}

# Create a numeric vector
nums <- c(1, 2, 2)
print(nums)

# Calculate and print the mean with 4 decimal precision
print(mean_precision <- calc_mean_precision(nums))