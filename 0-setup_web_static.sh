#!/usr/bin/env bash
# This Bash script sets up web servers for the deployment of web_static.

sudo apt-get -y update
sudo apt-get -y install nginx
sudo service nginx start

sudo mkdir -p /data/web_static/shared/
sudo mkdir -p /data/web_static/releases/test/
echo "<head></head>" | sudo tee /data/web_static/releases/test/index.html > /dev/null
sudo ln -sf /data/web_static/releases/test/ /data/web_static/current

sudo chown -R ubuntu:ubuntu /data/

sudo sed -i '44i \\n\tlocation /hbnb_static {\n\t\talias /data/web_static/current/;\n\t}' /etc/nginx/sites-available/default

sudo service nginx restart
