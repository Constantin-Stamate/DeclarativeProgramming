# Read the student-por dataset into a data frame
student_data <- read.csv("Lab4/DataAnalysis/data/student-por.csv", sep = ";", stringsAsFactors = FALSE, header = TRUE)

# Display the first 15 rows of the dataset
head(student_data, 15)

# Exercise 1 – Analysis of the dataset variables
# Display the structure of the dataset
str(student_data)

# Display the classes of each column
sapply(student_data, class)

# Exercise 2 – Calculation of basic statistics
# Identify numeric columns
numeric_cols_logical <- sapply(student_data, is.numeric)

# Calculate mean for numeric columns
apply(student_data[, numeric_cols_logical], 2, mean, na.rm = TRUE)

# Calculate median for numeric columns
apply(student_data[, numeric_cols_logical], 2, median, na.rm = TRUE)

# Calculate min for numeric columns
apply(student_data[, numeric_cols_logical], 2, min, na.rm = TRUE)

# Calculate max for numeric columns
apply(student_data[, numeric_cols_logical], 2, max, na.rm = TRUE)

# Calculate sd for numeric columns
apply(student_data[, numeric_cols_logical], 2, sd, na.rm = TRUE)

# Calculate summary for numeric columns
summary(student_data[, numeric_cols_logical])

# Exercise 3 – Calculation of the correlation matrix
# Identify numeric columns
numeric_cols <- sapply(student_data, is.numeric)

# Subset the data frame to include only numeric columns
student_numeric <- student_data[, numeric_cols]

# Calculate the correlation matrix
cor_matrix <- cor(student_numeric, use = "complete.obs")
print(cor_matrix)

# Save the correlation matrix to a CSV file
write.csv(cor_matrix, file = "Lab4/DataAnalysis/data/student_correlation_matrix.csv", row.names = TRUE)

# Exercise 4 – Display highly correlated variables
# Use the correlation matrix to find highly correlated variables
covariate_matrix <- cor_matrix

# Convert the correlation matrix to a data frame for easier filtering
cor_table <- as.data.frame(as.table(covariate_matrix))

# Filter for highly correlated variable pairs (absolute correlation > 0.7, excluding self-correlation)
high_covariate <- subset(cor_table, abs(Freq) > 0.7 & Freq != 1)
print(high_covariate)

# Save the highly correlated variable pairs to a CSV file
write.csv(high_covariate, file = "Lab4/DataAnalysis/data/student_high_covariates.csv", row.names = FALSE)

# Exercise 5 – Display box plots for all variables and interpret the results
# Identify numeric columns
numeric_cols <- sapply(student_data, is.numeric)

# Subset the data frame to include only numeric columns
student_numeric <- student_data[, numeric_cols]

# Display box plots for all numeric variables
boxplot(student_numeric, main = "Boxplots for numeric variables", ylab = "Values", col = "lightblue", border = "darkblue", las = 2)

# Exercise 6 – Display pairwise plots and interpret the results
# Identify numeric columns
numeric_cols <- sapply(student_data, is.numeric)

# Subset the data frame to include only numeric columns
student_numeric <- student_data[, numeric_cols]

# Display pairwise plots for numeric variables
pairs(student_numeric, main = "Pairwise plot for numeric variables", pch = 19, col = "blue")

# Exercise 7 – Display pairwise plots and box plots in a single combined graphic
# Load necessary libraries
library(GGally)
library(ggplot2)
library(reshape2)
library(gridExtra)

# Identify numeric columns
numeric_cols <- sapply(student_data, is.numeric)

# Subset the data frame to include only numeric columns
student_numeric <- student_data[, numeric_cols]

# Create pairwise plot using ggpairs
pair_plot_std <- ggpairs(student_numeric) + ggtitle("Pairwise plot - student-por")

# Melt the numeric data for box plot creation
student_melt <- melt(student_numeric)

# Create box plots using ggplot2
box_plot_std <- ggplot(student_melt, aes(x = variable, y = value, fill = variable)) + geom_boxplot() + ggtitle("Boxplots - student-por") + theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Arrange the pairwise plot and box plots side by side
grid.arrange(grobs = list(ggmatrix_gtable(pair_plot_std), box_plot_std), ncol = 2)

# Exercise 8 – Replace missing values with the mean or mode
# Identify numeric columns
numeric_cols <- sapply(student_data, is.numeric)

# Replace missing values in numeric columns with the mean
for(col in names(student_data)[numeric_cols]){
  medie <- mean(student_data[[col]], na.rm = TRUE)
  student_data[[col]][is.na(student_data[[col]])] <- medie
}

# Identify categorical columns
categorical_cols <- sapply(student_data, is.character)

# Replace missing values in categorical columns with the mode
for(col in names(student_data)[categorical_cols]){
  tab <- table(student_data[[col]])
  mod <- names(tab)[which.max(tab)]
  student_data[[col]][is.na(student_data[[col]]) | student_data[[col]] == ""] <- mod
}

# Verify that there are no missing values left
sapply(student_data, function(x) sum(is.na(x)))

# Exercise 9 – Create 2 random samples with sizes of 80% and 20% of the data
# Create a random seed for reproducibility
set.seed(123)  

# Get the number of rows in the dataset
n <- nrow(student_data) 

# Generate a random permutation of row indices
indices <- sample(1:n)        

# Calculate the size of the training set (80% of the data)
train_size <- floor(0.8 * n)  

# Create the training set with 80% of the data
train_indices <- indices[1:train_size]
train_data <- student_data[train_indices, ]

# Create the test set with the remaining 20% of the data
test_indices <- indices[(train_size + 1):n]
test_data <- student_data[test_indices, ]

# Display the dimensions of the training and test sets
dim(train_data)  
dim(test_data)   

# Exercise 10 – Create 3 equal-sized random samples
# Create a random seed for reproducibility
set.seed(123)  

# Get the number of rows in the dataset
n <- nrow(student_data)

# Generate a random permutation of row indices
indices <- sample(1:n)          

# Calculate the size of each sample (one-third of the data)
sample_size <- floor(n / 3)  

# Calculate total number of rows used in the three samples
total_used <- sample_size * 3  

# Create the three samples
sample1 <- student_data[indices[1:sample_size], ]
sample2 <- student_data[indices[(sample_size + 1):(2*sample_size)], ]
sample3 <- student_data[indices[(2*sample_size + 1):total_used], ]

# Display the dimensions of the three samples
dim(sample1)  
dim(sample2)
dim(sample3)

# Exercise 11 – Create a function named auto_mpg_analyse
analyse_student <- function(data) {
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

  write.csv(cor_matrix, file = "Lab4/DataAnalysis/data/student_correlation_matrix.csv", row.names = TRUE)
  
  cor_table <- as.data.frame(as.table(cor_matrix))

  high_cor <- subset(cor_table, abs(Freq) > 0.7 & Freq != 1)
  print(high_cor)

  write.csv(high_cor, file = "Lab4/DataAnalysis/data/student_high_covariates.csv", row.names = FALSE)

  boxplot(data_numeric, main = "Boxplots for numeric variables", col = "lightblue", border = "darkblue", las = 2)

  pairs(data_numeric, main = "Pairwise plot for numeric variables", pch = 19, col = "blue")
}

# Call the function with the student-por dataset
analyse_student(student_data)

# Exercise 12 – Create a function named Analysis_by_class
analysis_by_class_student <- function(data, class_col) {
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
    
    boxplot(data_numeric, main = paste("Boxplots - class", cls), col = "lightblue", border = "darkblue", las = 2)
    
    pairs(data_numeric, main = paste("Pairwise plot - class", cls), pch = 19, col = "blue")
  }
}

# Call the function with the student-por dataset and "school" as the class column
analysis_by_class_student(student_data, "school")