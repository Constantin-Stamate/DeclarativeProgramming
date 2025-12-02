import requests
from bs4 import BeautifulSoup
import csv
import os

# Create a function to save data to CSV
def save_to_csv(data, filepath):
    os.makedirs(os.path.dirname(filepath), exist_ok=True)
    with open(filepath, "w", newline="", encoding="utf-8") as f:
        writer = csv.writer(f)
        writer.writerows(data)
    print(f"Saved data to {filepath}")

# -------------------------------------------------------------
# 1. X-Rates
# -------------------------------------------------------------

# Define the URL for X-Rates currency table
url1 = "https://www.x-rates.com/table/?from=USD&amount=1"

# Send a GET request and parse the HTML content
resp1 = requests.get(url1, headers={'User-Agent': 'Mozilla/5.0'})

# Parse the HTML content using BeautifulSoup
soup1 = BeautifulSoup(resp1.text, "html.parser")

# Initialize table header for CSV storage
data1 = [["Currency", "Rate"]]

# Find the currency table and extract data
table1 = soup1.find("table", class_="tablesorter ratesTable")

# Extract currency data from the table
if table1:
    for row in table1.find_all("tr")[1:]:
        cols = row.find_all("td")
        if len(cols) >= 2:
            data1.append([cols[0].text.strip(), cols[1].text.strip()])

# Save the extracted data to a CSV file
save_to_csv(data1, "Lab6/AutomaticDataCollection/data/currency_xrates.csv")

# -------------------------------------------------------------
# 2. BNM (Moldova)
# -------------------------------------------------------------

# Define the URL for BNM currency rates
url2 = "https://www.bnm.md/ro/content/ratele-de-schimb"

# Send a GET request and parse the HTML content
resp2 = requests.get(url2, headers={'User-Agent': 'Mozilla/5.0'})

# Parse the HTML content using BeautifulSoup
soup2 = BeautifulSoup(resp2.text, "html.parser")

# Initialize table header for CSV storage
data2 = [["Currency", "Rate"]]

# Find the currency tables and extract data
tables = soup2.find_all("table", class_="rates")

# Extract currency data from the tables
for table2 in tables[:2]:  
    for row in table2.find_all("tr")[1:]: 
        cols = row.find_all("td")
        if len(cols) >= 5:
            currency = cols[2].text.strip()
            rate = cols[4].text.strip()
            data2.append([currency, rate])

# Save the extracted data to a CSV file
save_to_csv(data2, "Lab6/AutomaticDataCollection/data/currency_bnm.csv")

# -------------------------------------------------------------
# 3. CursValutar.com
# -------------------------------------------------------------

# Define the URL for CursValutar.com currency rates
url3 = "https://www.cursvalutar.com/"

# Send a GET request and parse the HTML content
resp3 = requests.get(url3, headers={'User-Agent': 'Mozilla/5.0'})

# Parse the HTML content using BeautifulSoup
soup3 = BeautifulSoup(resp3.text, "html.parser")

# Initialize table header for CSV storage
data3 = [["Currency", "Rate"]]

# Find the currency table and extract data
table3 = soup3.find("table", class_="table table-striped text-right")

# Extract currency data from the table
if table3:
    for row in table3.find_all("tr")[1:]:
        cols = row.find_all("td")
        if len(cols) >= 3:
            currency = cols[0].text.strip()
            rate = cols[2].text.strip()
            data3.append([currency, rate])

# Save the extracted data to a CSV file
save_to_csv(data3, "Lab6/AutomaticDataCollection/data/currency_cursvalutar.csv")