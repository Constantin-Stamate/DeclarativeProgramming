# Create sequence of x values from -2 to 2
x <- seq(-2, 2, length.out = 200)

# Create y values using the polynomial function
y <- x^5 + x^3 - 3*x

# Create line plot of the polynomial function
plot(x, y, type = "l", col = "blue", lwd = 2, main = "Graph of the polynomial function", xlab = "x", ylab = "f(x)")