#!/bin/bash
#

# install java 8.  Jenkins doesn't support 10 yet
sudo apt update
sudo apt install openjdk-8-jdk

# import keys
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -

# Add jenkins repo
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

# install jenkins
sudo apt update
sudo apt install jenkins

# should be good messages:
systemctl status jenkins

# open 8080 for firewall
sudo ufw allow 8080
sudo ufw status

