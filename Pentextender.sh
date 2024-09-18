#!/bin/bash

# Function to prompt user to press any key
press_any_key() {
    echo "Press any key to continue..."
    read -n 1 -s -r -p ""
    echo
}

# Function to display error message and exit
display_error() {
    echo "Error: $1"
    exit 1
}

# Update and upgrade system
sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y || display_error "Failed to update system."

# Install necessary packages
sudo apt install -y gobuster xxd dirsearch feroxbuster seclists mingw-w64 || display_error "Failed to install packages."
pip install pyftpdlib || display_error "Failed to install pyftpdlib."
sudo apt install -y peass chisel ncat neo4j bloodhound kpcli || display_error "Failed to install packages."
sudo apt install -y pipx git || display_error "Failed to install pipx and git."
pipx ensurepath || display_error "Failed to configure pipx."
pipx install git+https://github.com/Pennyw0rth/NetExec || display_error "Failed to install NetExec."
pip install git-dumper || display_error "Failed to install git-dumper."

# Inform user about next steps
echo "------------------------------------------------"
echo "Now open firefox and install Firefox Extensions:"
echo "- FoxyProxy"
echo "- Hack-Tools"
echo "- Wappalyzer"
echo "- Cookie Editor"
press_any_key

echo "------------------------------------------------"
echo "Now configure Burp Suite: Set the Foxy Proxy 127.0.0.1:8080 and import CA Certificate from http://burp"
press_any_key

echo "------------------------------------------------"
echo "Now Install wine, rustscan and configure neo4j/Bloodhound."
press_any_key

# Display final message
echo "Kali Linux is now ready for work"
