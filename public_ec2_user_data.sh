#!/bin/bash
sudo apt-get update -y
git clone https://github.com/muneeb10997/AWS-3tier-todo-application-frontend.git
cd AWS-3tier-todo-application-frontend
sudo python3 -m http.server 80