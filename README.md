# Declarative Programming — Labs

This repository contains scripts and operations for laboratory exercises of the **Declarative Programming Course** at **UTM (Technical University of Moldova)**. It covers the use of data structures in R, including vectors, matrices, lists, and data frames, aimed at supporting practical learning and exercises in the course.

## Lab 1 — Introduction to data structures

- Goal: Learn the basic data structures in R and basic data manipulation.
- Contents (summary):
	- Data frames: reading, selecting rows/columns, adding/removing columns.
	- Vectors: creation, indexing, element-wise operations.
	- Matrices: creation, transpose, basic matrix operations.
	- Basic functions: mean, median, variance and simple plotting.

## Lab 2 — Advanced operations on data structures

- Goal: Apply more advanced transformations and analyses.
- Contents (summary):
	- Advanced `data.frame` manipulation: filtering, aggregation, merging (merge, rbind, cbind).
	- Lists: creation, accessing elements, using lists for grouped results.
	- Vectorized operations and functional approaches (apply/map/reduce).
	- Matrix transformations and conversions between structures.

## Lab 3 — Data analysis and visualization

- Goal: Implement functions, visualize mathematical and dataset-based graphs, and manipulate data using R.
- Contents (summary):
    - Functions: calculating mean with precision, factorial calculation using `for` loops and `prod()`.
    - Graphs:
        - Plotting sine functions with custom colors and line width.
        - Scatter plots using the Orange dataset with customized parameters.
        - Normal distribution plot with legends.
        - Polynomial function plot.
    - Data manipulation using `tidyverse` and `dplyr`:
        - Filter, select, rename, mutate/transmute, arrange, distinct, summarise.
        - Group operations using `group_by()`.
        - Handling missing values with mean/mode.
        - Creating random samples for training and testing.
    - Visual exploration:
        - Boxplots for numeric variables.
        - Pairwise plots for numeric variables.

## Lab 4 — Data processing and analysis

- Goal: Process, analyze, and visualize datasets using R functions and custom functions.
- Contents (summary):
    - Data exploration and variable analysis.
    - Calculation of basic statistics and correlation matrices.
    - Identification and saving of highly correlated variables.
    - Handling missing data with mean or mode.
    - Creation of random samples for training and testing.
    - Visual exploration:
        - Boxplots for numeric variables.
        - Pairwise plots.
        - Combined visualizations of boxplots and pairwise plots.
    - Custom functions for automating analysis and class-based exploration.

## Installation

1. Install R (if not already): https://cran.r-project.org/

2. Open a terminal in the project folder.

3. Run an R script with `Rscript` or load it inside an interactive R/RStudio session.

Example (PowerShell):

```powershell
Rscript .\Lab1\IntroDataStructures\src\matrix_analysis.R
```

Example (R):

```r
source("Lab1/IntroDataStructures/src/matrix_analysis.R")
```

## Notes

- Many scripts accept input files from the corresponding `data/` folder or optional arguments — check the top comments of each script for usage examples.
- To enable code completion and a better editing experience in Visual Studio Code, install the `languageserver` R package and the R extension for VS Code.

## Technologies

- Language: R
- Editor: Visual Studio Code (with R extension)

## Author

This analysis was developed as part of the **Declarative Programming Course** organized at **UTM (Technical University of Moldova)**.

- GitHub: [Constantin-Stamate](https://github.com/Constantin-Stamate)
- Email: constantinstamate.r@gmail.com