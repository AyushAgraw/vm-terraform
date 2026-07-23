#!/bin/bash
apt update
apt install nginx -y
git clone https://github.com/devopsinsiders/StreamFlix.git
cp -r /StreamFlix/* /var/www/html