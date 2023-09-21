#!/bin/bash

sudo yum install nginx -y
sudo echo "<h1>This is my new server</h1>" > /usr/share/nginx/html/index.html
sudo systemctl enable nginx
sudo systemctl start nginx