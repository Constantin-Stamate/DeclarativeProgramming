# Create numeric sequence from 0.5 to 3π
x <- seq(0.5, 3 * pi, length.out = 100)

# Compute sine of each element in the sequence
y <- sin(x)

# Plot the sine function with specified parameters
plot(x, y, type = "l", col = "red", lwd = 15, main = "Graficul funcției sinus", xlab = "x", ylab = "sin(x)")