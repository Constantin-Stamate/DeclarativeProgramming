import requests
from bs4 import BeautifulSoup

# Define the base URL for the book listings
base_url = "https://books.toscrape.com/catalogue/page-{}.html"

# Create a list to hold titles of books with 2-star ratings
two_star_books = []

# Loop through the first 50 pages of the book listings
for page in range(1, 51):
    # Format the URL for the current page
    url = base_url.format(page)

    # Send a GET request to the page and parse the HTML content
    response = requests.get(url)

    # Parse the HTML content using BeautifulSoup
    soup = BeautifulSoup(response.text, "html.parser")

    # Find all book articles on the page
    books = soup.find_all("article", class_="product_pod")

    # Check each book for a 2-star rating and collect its title
    for book in books:
        if book.find("p", class_="star-rating Two"):
            title = book.h3.a["title"]
            two_star_books.append(title)

# Print the list of 2-star book titles
print("Books with 2 stars:\n", two_star_books)