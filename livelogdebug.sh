#!/bin/bash
# Set keywords to search for
KEYWORDS="error|err|fail|failed|failure|warn"
# Grep syslog for matching lines
ERROR_LINES=$(grep -iE "${KEYWORDS}" 
/var/log/syslog)
# Loop through matching lines and perform search
for LINE in "${ERROR_LINES[@]}"; do
  # Search for full line using Firefox and echo 
  # debugging message
  SEARCH_URL="https://www.google.com/search?q=${LINE}" 
  echo "Performing Google search for: ${LINE}" 
  firefox-esr "${SEARCH_URL}"
done
