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

## Lab 5 — Higher-order functions and anonymous functions

- Goal: Understanding and using higher-order functions such as `map()`, `filter()`, `reduce()`, and anonymous functions (`lambda`) for solving Python programming tasks.
- Contents (summary):
    - Dictionary definition and manipulation using string keys and float values.
    - Random number generation and conversion of seconds into the `hh:mm:ss` time format.
    - Lambda-based computation of sums and differences between float values.
    - Application of `map()` together with lambda functions on different data types.
    - Extraction of distinct integer values from a list using `filter()`.
    - Occurrence counting of a character in a string using `reduce()`.
    - String concatenation using a function that accepts a variable number of inputs.
    - Lambda function list creation for:
        - returning the second character of a string,
        - converting a string to uppercase,
        - determining the position of a specified character.
    - Average calculation of three grades using default values when arguments are missing.
    - Recursive computation of the sum of the first N natural numbers.

## Lab 6 — Automated data collection

- Goal: Understanding web scraping with Python and using it to collect data from websites in an automated way.
- Contents (summary):
    - Introduction to web scraping and the limitations some websites impose on automated access.
    - Retrieving the HTML code of a web page using `requests` or `urlopen()`.
    - Parsing HTML structure with `BeautifulSoup` and selecting relevant elements.
    - Handling legal and technical considerations for responsible scraping.
    - Installing required Python libraries:
        - `requests`
        - `lxml`
        - `beautifulsoup4`
    - Working with BeautifulSoup:
        - `soup = BeautifulSoup(html, "html.parser")`
        - Accessing elements via tags, classes, and attributes.
        - Filtering and extracting specific data such as titles, headings, images, ratings, prices, or weather information.
    - Sending HTTP requests with custom headers to avoid blocks:
        - `requests.get(URL, headers={"User-Agent":"Mozilla/5.0"})`
    - Looping through multiple pages or sections to collect all relevant data.
    - Storing extracted data in Python lists and exporting to `.csv` files.

## Lab 7 — Manipulating data with Pandas

- Goal: Learn to import, explore, and manipulate climate data using the Pandas library in Python.
- Contents (summary):
    - Introduction to Pandas for data manipulation.
    - Importing climate data from CSV files.
    - Understanding the structure of DataFrames and basic descriptive statistics.
    - Handling missing values and duplicates.
    - Separating metadata (station info) from measurement data.
    - Setting meaningful indexes for DataFrames.
    - Joining and combining DataFrames based on keys.
    - Filtering data by conditions (e.g., altitude, temperature thresholds).
    - Aggregating data: finding min, max, mean values.
    - Working with subsets: selecting data for specific stations or time periods.

## Lab 8 — Numerical & symbolic computation with NumPy, SciPy and SymPy

- Goal: Learn to perform numerical, symbolic, and scientific computations in Python using the NumPy, SciPy, and SymPy libraries.
- Contents (summary):
    - Introduction to symbolic mathematics with SymPy.
    - Working with arbitrary precision numbers.
    - Rational arithmetic and exact computations.
    - Polynomial expansion and algebraic simplification.
    - Manipulating trigonometric expressions.
    - Computing limits, derivatives, and solving equations.
    - Systems of linear equations.
    - Boolean logic and satisfiability checking.
    - Differential equations (Bernoulli equation).
    - Numerical integration with SciPy (`quad`).
    - Fourier transform, generating and analyzing signals.
    - Optimization problems using `scipy.optimize.fmin`.
    - Image manipulation using `scipy.ndimage`: rotation, resolution changes, noise, filtering.
    - Comparing performance of Gaussian, median, and Wiener filters.

## Installation

1. Install Python (if not already): https://www.python.org/downloads/
2. Install Jupyter Notebook: `pip install notebook`
3. Install R (if not already): https://cran.r-project.org/
4. Open a terminal in the project folder.

### Run a Python script

1. Example (PowerShell / Command Prompt):
python .\Lab6\AutomaticDataCollection\src\book_scraper.py

2. Example (Linux/macOS):
python3 ./Lab6/AutomaticDataCollection/src/book_scraper.py

### Run a Jupyter Notebook

1. Start Jupyter Notebook in the project folder:
jupyter notebook

2. Navigate to the folder and open the desired `.ipynb` file in your browser.
3. Run cells with Shift + Enter.

### Run an R script

1. Example (PowerShell):
Rscript .\Lab1\IntroDataStructures\src\matrix_analysis.R

2. Example (R interactive session):
source("Lab1/IntroDataStructures/src/matrix_analysis.R")

## Notes

- Many scripts accept input files from the corresponding `data/` folder or optional arguments — check the top comments of each script for usage examples.
- To enable code completion and a better editing experience in Visual Studio Code, install the `languageserver` R package and the R extension for VS Code.

## Technologies

- Languages: R, Python
- Notebook: Jupyter Notebook
- Editor: Visual Studio Code (with R and Python extensions)

## Author

This analysis was developed as part of the **Declarative Programming Course** organized at **UTM (Technical University of Moldova)**.

- GitHub: [Constantin-Stamate](https://github.com/Constantin-Stamate)
- Email: constantinstamate.r@gmail.com