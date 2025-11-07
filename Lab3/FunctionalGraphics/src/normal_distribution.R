# Create sequence of 100 values from -6 to 6
x <- seq(-6, 6, length.out = 100)

# Create normal density values for the sequence with mean 0 and sd 1
y <- dnorm(x, mean = 0, sd = 1)

# Create line plot of the normal distribution
plot(x, y, type = "l", main = "Normal Distribution", col = "blue", lwd = 2,xlab = "x", ylab = "dnorm(x)")

# Create legend for the plot
legend("topright", legend = "Normal distribution from -6 to 6", col = "blue", lwd = 2)