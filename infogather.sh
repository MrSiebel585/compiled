





echo "Running Nmap..."
nmap -sS -sV -O target_ip

echo "Running Recon-ng..."
recon-ng -r target_domain

echo "Running theHarvester..."
theharvester -d target_domain -l 500 -b google

echo "Running Shodan..."
shodan init YOUR_API_KEY
shodan search target_ip

echo "Running Maltego..."



echo "Running Metasploit Framework..."
automsfrecon

echo "Running Wireshark..."
wireshark

echo "Running Nikto..."
nikto -h target_url
