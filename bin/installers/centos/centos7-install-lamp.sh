#!/bin/bash
#
# Install LAMP and prequisites.
#
#

# Check for git and install it
if rpm -qa | grep git.x86_64; then
  echo "git is already installed."
else
  sudo yum -y install git
fi

# check for apache
if rpm -qa | grep httpd.x86_64; then
  echo "apache httpd already installed [skipping]"
else
  sudo yum -y install httpd
fi

sudo systemctl start httpd.service

# enable on boot
sudo systemctl enable httpd.service

#
# Step 2: Install MySQL (MariaDB)
#
sudo yum install mariadb-server mariadb
sudo systemctl start mariadb

echo "****** NOW SECURE IT ******"
sudo mysql_secure_installation

echo "** enabling Maria DB on boot."
sudo systemctl enable mariadb.service

sudo yum install php php-mysql
sudo systemctl restart httpd.service


