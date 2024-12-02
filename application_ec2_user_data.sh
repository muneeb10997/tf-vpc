#!/bin/bash

# Update package list and install Python3 and pip
sudo apt-get update -y
sudo pip3 install --break-system-packages flask flask-mysqldb flask-cors

# Install necessary Python packages globally (no virtual environment)
sudo apt install python3-flask

# Clone your Flask app from GitHub
git clone https://github.com/muneeb10997/backend.git /home/ubuntu/backend

# Navigate to the app directory
cd /home/ubuntu/backend

# Run the Flask app in the background using nohup
nohup python3 app.py
