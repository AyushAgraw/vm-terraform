#!/bin/bash
apt update
apt install nginx
git clone https://github.com/devopsinsiders/StreamFlix.git
cp -r /StreamFlix/* /var/www/html