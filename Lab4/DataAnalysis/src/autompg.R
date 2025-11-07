# Read the auto-mpg dataset into a data frame
cars_data <- read.table("Lab4/DataAnalysis/data/auto-mpg.data", header = FALSE, sep = "", quote = "\"", stringsAsFactors = FALSE)

# Display the first 15 rows of the dataset
head(cars_data, 15)

# Assign column names to the dataset
colnames(cars_data) <- c("mpg","cyl","disp","hp","wt","qsec","model_year","origin","car_name")

# Exercise 1 – Analysis of the dataset variables
# Display the structure of the dataset
str(cars_data)

# Display the classes of each column
sapply(cars_data, class)

# Exercise 2 – Calculation of basic statistics
# Identify numeric columns
numeric_cols <- c("mpg","cyl","disp","hp","wt","qsec","model_year","origin")

# Convert columns to numeric, handling "?" as NA
for(col in numeric_cols){
  cars_data[[col]][cars_data[[col]] == "?"] <- NA
  cars_data[[col]] <- as.numeric(cars_data[[col]])
}

# Identify numeric columns
numeric_cols <- sapply(cars_data, is.numeric)

# Calculate mean for numeric columns
apply(cars_data[, numeric_cols], 2, mean, na.rm = TRUE)

# Calculate median for numeric columns
apply(cars_data[, numeric_cols], 2, median, na.rm = TRUE)

# Calculate min for numeric columns
apply(cars_data[, numeric_cols], 2, min, na.rm = TRUE)

# Calculate max for numeric columns
apply(cars_data[, numeric_cols], 2, max, na.rm = TRUE)

# Calculate sd for numeric columns
apply(cars_data[, numeric_cols], 2, sd, na.rm = TRUE)

# Calculate summary for numeric columns
summary(cars_data[, numeric_cols])

# Exercise 3 – Calculation of the correlation matrix
# Identify numeric columns
numeric_cols <- sapply(cars_data, is.numeric)

# Subset the data frame to include only numeric columns
cars_numeric <- cars_data[, numeric_cols]

# Calculate the correlation matrix
cor_matrix <- cor(cars_numeric, use = "complete.obs") 
print(cor_matrix)

# Save the correlation matrix to a CSV file
write.csv(cor_matrix, file = "Lab4/DataAnalysis/data/auto_mpg_correlation_matrix.csv", row.names = TRUE)

# Exercise 4 – Display highly correlated variables
# Use the correlation matrix from the last exercise
covariate_matrix <- cor_matrix

# Convert the correlation matrix to a data frame
cor_table <- as.data.frame(as.table(covariate_matrix))

# Filter for pairs with absolute correlation greater than 0.7 (excluding self-correlations)
high_covariate <- subset(cor_table, abs(Freq) > 0.7 & Freq != 1)
print(high_covariate)

# Save the highly correlated pairs to a CSV file
write.csv(high_covariate, file = "Lab4/DataAnalysis/data/auto_mpg_high_covariates.csv", row.names = FALSE)

# Exercise 5 – Display box plots for all variables and interpret the results
# Identify numeric columns
numeric_cols <- sapply(cars_data, is.numeric)

# Subset the data frame to include only numeric columns
cars_numeric <- cars_data[, numeric_cols]

# Set up the plotting area
par(mfrow = c(ceiling(length(cars_numeric)/2), 2))  

# Create box plots for each numeric variable
for(col in colnames(cars_numeric)){
  boxplot(cars_numeric[[col]], main = paste("Boxplot for", col), ylab = col, col = "lightblue", border = "darkblue")
}

# Reset plotting area
par(mfrow = c(1,1)) 

# Exercise 6 – Display pairwise plots and interpret the results
# Identify numeric columns
numeric_cols <- sapply(cars_data, is.numeric)

# Subset the data frame to include only numeric columns
cars_numeric <- cars_data[, numeric_cols]

# Create pairwise plots for numeric variables
pairs(cars_numeric, main = "Pairwise plot for numeric variables", pch = 19, col = "blue")

# Exercise 7 – Display pairwise plots and box plots in a single combined graphic
# Load necessary libraries
library(GGally)
library(ggplot2)
library(reshape2)
library(gridExtra)

# Identify numeric columns
numeric_cols <- sapply(cars_data, is.numeric)

# Subset the data frame to include only numeric columns
cars_numeric <- cars_data[, numeric_cols]

# Create pairwise plot using ggpairs
pair_plot <- ggpairs(cars_numeric) + ggtitle("Pairwise plot - auto-mpg")

# Melt the data for box plots
cars_melt <- melt(cars_numeric)

# Create box plots using ggplot2
box_plot <- ggplot(cars_melt, aes(x = variable, y = value, fill = variable)) + geom_boxplot() + ggtitle("Boxplots - auto-mpg") + theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Arrange the pairwise plot and box plots side by side
grid.arrange(grobs = list(ggmatrix_gtable(pair_plot), box_plot), ncol = 2)

# Exercise 8 – Replace missing values with the mean or mode
# Identify numeric columns
numeric_cols <- sapply(cars_data, is.numeric)

# Replace missing values in numeric columns with the mean
for(col in names(cars_data)[numeric_cols]){
  medie <- mean(cars_data[[col]], na.rm = TRUE)
  cars_data[[col]][is.na(cars_data[[col]])] <- medie
}

# Identify categorical columns
categorical_cols <- sapply(cars_data, is.character)

# Replace missing values in categorical columns with the mode
for(col in names(cars_data)[categorical_cols]){
  tab <- table(cars_data[[col]])
  mod <- names(tab)[which.max(tab)]
  cars_data[[col]][is.na(cars_data[[col]]) | cars_data[[col]] == ""] <- mod
}

# Verify that there are no missing values left
sapply(cars_data, function(x) sum(is.na(x)))

# Exercise 9 – Create 2 random samples with sizes of 80% and 20% of the data
# Create a random seed for reproducibility
set.seed(123)  

# Get the number of rows in the dataset
n <- nrow(cars_data)

# Generate a random permutation of row indices
indices <- sample(1:n) 

# Calculate the size of the training set (80% of the data)
train_size <- floor(0.8 * n)

# Create the training set with 80% of the data
train_indices <- indices[1:train_size]
train_data <- cars_data[train_indices, ]

# Create the test set with the remaining 20% of the data
test_indices <- indices[(train_size + 1):n]
test_data <- cars_data[test_indices, ]

# Display the dimensions of the training and test sets
dim(train_data)  
dim(test_data)   

# Exercise 10 – Create 3 equal-sized random samples
# Create a random seed for reproducibility
set.seed(123) 

# Get the number of rows in the dataset
n <- nrow(cars_data)

# Generate a random permutation of row
indices <- sample(1:n)  

# Calculate the size of each sample (one-third of the data)
sample_size <- floor(n / 3) 

# Calculate total number of rows used for 3 samples
total_used <- sample_size * 3  

# Generate random permutation of row indices
indices <- sample(1:n)

# Create 3 samples of equal size
sample1 <- cars_data[indices[1:sample_size], ]
sample2 <- cars_data[indices[(sample_size + 1):(2*sample_size)], ]
sample3 <- cars_data[indices[(2*sample_size + 1):total_used], ]

# Display the dimensions of the 3 samples
dim(sample1)  
dim(sample2)
dim(sample3)

# Exercise 11 – Create a function named auto_mpg_analyse
auto_mpg_analyse <- function(data) {
  numeric_cols <- sapply(data, is.numeric)

  data_numeric <- data[, numeric_cols]
  
  stats_mean <- apply(data_numeric, 2, mean, na.rm = TRUE)

  stats_median <- apply(data_numeric, 2, median, na.rm = TRUE)

  stats_min <- apply(data_numeric, 2, min, na.rm = TRUE)

  stats_max <- apply(data_numeric, 2, max, na.rm = TRUE)

  stats_sd <- apply(data_numeric, 2, sd, na.rm = TRUE)

  print(data.frame(mean = stats_mean, median = stats_median, min = stats_min, max = stats_max, sd = stats_sd))

  cor_matrix <- cor(data_numeric, use = "complete.obs")
  print(cor_matrix)

  write.csv(cor_matrix, file = "Lab4/DataAnalysis/data/auto_mpg_correlation_matrix.csv", row.names = TRUE)

  cor_table <- as.data.frame(as.table(cor_matrix))

  high_cor <- subset(cor_table, abs(Freq) > 0.7 & Freq != 1)
  print(high_cor)

  write.csv(high_cor, file = "Lab4/DataAnalysis/data/auto_mpg_high_covariates.csv", row.names = FALSE)

  par(mfrow = c(ceiling(length(data_numeric)/2), 2))

  for(col in colnames(data_numeric)) {
    boxplot(data_numeric[[col]], main = paste("Boxplots for", col), ylab = col, col = "lightblue", border = "darkblue")
  }

  par(mfrow = c(1,1))

  pairs(data_numeric, main = "Pairwise plot for numeric variables", pch = 19, col = "blue")
}

# Call the function with the auto-mpg dataset
auto_mpg_analyse(cars_data)

# Exercise 12 – Create a function named Analysis_by_class
analysis_by_class <- function(data, class_col) {
  if(!class_col %in% colnames(data)) {
    stop("The specified class column does not exist in the data frame")
  }
  
  classes <- unique(data[[class_col]])
  
  for(cls in classes) {
    data_subset <- data[data[[class_col]] == cls, ]
    
    numeric_cols <- sapply(data_subset, is.numeric)

    data_numeric <- data_subset[, numeric_cols]
    
    stats_mean <- apply(data_numeric, 2, mean, na.rm = TRUE)

    stats_median <- apply(data_numeric, 2, median, na.rm = TRUE)

    stats_min <- apply(data_numeric, 2, min, na.rm = TRUE)

    stats_max <- apply(data_numeric, 2, max, na.rm = TRUE)

    stats_sd <- apply(data_numeric, 2, sd, na.rm = TRUE)
    
    print(data.frame(mean = stats_mean, median = stats_median, min = stats_min, max = stats_max, sd = stats_sd))
    
    cor_matrix <- cor(data_numeric, use = "complete.obs")
    print(cor_matrix)
    
    cor_table <- as.data.frame(as.table(cor_matrix))

    high_cor <- subset(cor_table, abs(Freq) > 0.7 & Freq != 1)
    print(high_cor)
    
    par(mfrow = c(ceiling(length(data_numeric)/2), 2))

    for(col in colnames(data_numeric)) {
      boxplot(data_numeric[[col]], main = paste("Boxplot for", col, "- class", cls), ylab = col, col = "lightblue", border = "darkblue")
    }

    par(mfrow = c(1,1))

    pairs(data_numeric, main = paste("Pairwise plot - class", cls), pch = 19, col = "blue")
  }
}

# Call the function with the auto-mpg dataset and "origin" as the class column
analysis_by_class(cars_data, "origin")