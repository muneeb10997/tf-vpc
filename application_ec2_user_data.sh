#!/bin/bash
sudo apt update
sudo apt install -y python3 python3-pip
sudo apt install -y pkg-config libmysqlclient-dev
sudo python3 -m pip install mysqlclient --break-system-packages

sudo python3 -m pip install flask flask-mysqldb flask-cors --break-system-packages --no-deps
git clone https://github.com/muneeb10997/backend.git
cd backend
python3 app.py