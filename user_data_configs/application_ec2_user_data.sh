#!/bin/bash

# Update package list and install Python3 and pip
sudo apt-get update -y
sudo apt install -y python3-pip
sudo apt install -y python3-flask
# Install necessary Python packages globally (no virtual environment)
sudo apt-get install -y libmysqlclient-dev
sudo apt-get install -y pkg-config libmysqlclient-dev
sudo pip3 install --break-system-packages flask flask-cors flask-mysqldb
 
# Clone your Flask app from GitHub
git clone https://github.com/muneeb10997/backend.git /home/ubuntu/backend

# Navigate to the app directory
cd /home/ubuntu/backend

# Run the Flask app in the background using nohup
nohup python3 app.py
