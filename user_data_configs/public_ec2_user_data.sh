#!/bin/bash
sudo apt-get update -y
git clone https://github.com/muneeb10997/AWS-3tier-todo-application-frontend.git /home/ubuntu/AWS-3tier-todo-application-frontend
cd AWS-3tier-todo-application-frontend
sudo python3 -m http.server 80