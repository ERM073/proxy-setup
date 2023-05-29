#!/bin/bash

# Update package lists
apt update

# Install ufw & Privoxy
apt install privoxy -y
apt install ufw -y

# Open Proxy Port
sudo ufw allow 8118
sudo ufw reload 

# Add the following lines at the end of the file:
sudo sed -i '/^listen-address/d' /etc/privoxy/config
sudo sed -i '/^permit-access/d' /etc/privoxy/config
echo "listen-address 0.0.0.0:8118" | sudo tee -a /etc/privoxy/config
echo "permit-accress 0.0.0.0" | sudo tee -a /etc/privoxy/config
# Save and exit the nano editor

# Restart Privoxy service
systemctl restart privoxy

clear

# Get server's external IP address
external_ip=$(curl -s https://ipinfo.io/ip)

# Display server's external IP and Privoxy port
echo "################################"
echo "Proxy IP: $external_ip"
echo "Proxy Port: 8118"
echo "################################"
