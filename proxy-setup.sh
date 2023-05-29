#!/bin/bash

# Update package lists
apt update

# Install Privoxy
apt install privoxy -y

# Add the following lines at the end of the file:
echo "listen-address 0.0.0.0:9741" | sudo tee -a /etc/privoxy/config
echo "permit-access 0.0.0.0" | sudo tee -a /etc/privoxy/config

# Save and exit the nano editor

# Restart Privoxy service
systemctl restart privoxy

# Get server's external IP address
external_ip=$(curl -s https://ipinfo.io/ip)

# Display server's external IP and Privoxy port
echo "################################"
echo "Proxy IP: $external_ip"
echo "Proxy Port: 9741"
echo "################################"
