import requests
from bs4 import BeautifulSoup

# Define the URL of the Wikipedia page to scrape
url = "https://en.wikipedia.org/wiki/Java_(programming_language)"

# Send an HTTP GET request to the website with a user-agent to avoid blocking
response = requests.get(url, headers={"User-Agent": "Mozilla/5.0"})

# Parse the HTML content using BeautifulSoup
soup = BeautifulSoup(response.text, "html.parser")

# Extract and print the page title
page_title = soup.find("h1").text
print("Page title:", page_title)

# Extract and print all section titles
section_titles = [h2.text.strip() for h2 in soup.find_all("h2")]
print("Section titles:", section_titles)

# Find the first image on the page and print its URL
image = soup.find("img")
if image:
    image_url = "https:" + image["src"]
    print("Image URL:", image_url)
else:
    print("No image found")