#Sulem Morales Date: 10/20/2024
#ISS 212 CS Scripting - Week 6 Tool Dev 4
#References - Tool Dev 4 walkthrough

import re

# Load the log file
with open('auth.log', 'r') as file:
	log_data = file.read()

# Regex pattern for failed login IP addresses
pattern = r"Failed password .* from (\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})"

# Find all matching IP addresses
suspicious_ips = re.findall(pattern, log_data)

# Get unique IP addresses and display them
unique_ips = set(suspicious_ips)
print("Suspicious IP addresses:")
for ip in unique_ips:
	print(ip)
