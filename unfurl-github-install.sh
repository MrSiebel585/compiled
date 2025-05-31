#!/bin/bash

# Clone the Unfurl repository from GitHub
git clone https://github.com/obsidianforensics/unfurl.git

# Navigate into the cloned directory
cd unfurl/

# Install required Python libraries using pip3 package manager.
pip3 install -r requirements.txt

# Configure Graphviz tool for visualization of parsed data in unfurled output format.
sudo apt-get update && sudo apt-get install graphviz -y 

echo "Unfurl successfully installed and configured!"
