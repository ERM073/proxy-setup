#!/bin/bash

# Update package lists
apt update

# Install ufw & Privoxy
apt install privoxy -y
apt install ufw -y

# Open Proxy Port
sudo ufw allow 9741
sudo ufw reload 
# Add the following lines at the end of the file:
if ! grep -q "listen-address 0.0.0.0:9741" /etc/privoxy/config; then
  echo "listen-address 0.0.0.0:9741" | sudo tee -a /etc/privoxy/config
fi

if ! grep -q "permit-access 0.0.0.0" /etc/privoxy/config; then
  echo "permit-access 0.0.0.0" | sudo tee -a /etc/privoxy/config
fi

# Save and exit the nano editor

# Restart Privoxy service
systemctl restart privoxy

clear

# Get server's external IP address
external_ip=$(curl -s https://ipinfo.io/ip)

# Display server's external IP and Privoxy port
echo "################################"
echo "Proxy IP: $external_ip"
echo "Proxy Port: 9741"
echo "################################"
