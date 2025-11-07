# Create the initial vector of sizes
size <- c(178, 175, 160, 191, 176, 155, 163, 174, 182)

# Define the new sizes to be added
new_size <- c(164, 172, 156, 195, 166)

# Create the new vector with the specified modifications
new.size <- c(rep(new_size, times = 2), size[(length(size)-6):length(size)])
print(new.size)

# Save the new vector to a CSV file
write.csv(new.size, file = "Lab2/CoreDataStructures/data/new_size.csv", row.names = FALSE)