#!/bin/bash

# Update package lists
apt update

# Install Privoxy
apt install privoxy -y

# Edit Privoxy configuration
nano /etc/privoxy/config

# Add the following lines at the end of the file:
# listen-address 0.0.0.0:9741
# permit-access 0.0.0.0

# Save and exit the nano editor

# Restart Privoxy service
systemctl restart privoxy

# Get server's external IP address
external_ip=$(curl -s https://ipinfo.io/ip)

# Display server's external IP and Privoxy port
echo "ServerIP: $external_ip"
echo "Proxy Port: 9741"
