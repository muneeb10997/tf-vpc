#!/bin/bash
sudo apt update
sudo apt install -y python3 python3-pip
pip3 install flask flask-mysqldb flask-cors
cd ~
git clone https://github.com/muneeb10997/backend.git
cd backend
python3 app.py