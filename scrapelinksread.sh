#!/bin/bash

#UNFINSHED 

# ask the user for the URL to crawl
echo "Enter the URL to crawl:"
read url

# retrieve the content of the webpage
content=$(curl -s "$url")

# extract the links from the HTML content using regex
links=$(echo "$content" | grep -Eo 'href="[^"]+"' | sed 's/href="//;s/"//')

# print the links
for link in $links; do
    echo "$link"
