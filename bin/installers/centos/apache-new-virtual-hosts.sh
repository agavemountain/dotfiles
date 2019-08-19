#!/bin/bash
#

# debian structure
mkdir -p /etc/httpd/sites-available
mkdir -p /etc/httpd/sites-enabled

if grep -Fxq "sites-enabled" /etc/httpd/conf/httpd.conf 
then
    # code if found
    echo "Detected sites-enabled in httpd.conf.  Exiting."
    exit
else
    # code if not found
    echo "IncludeOptional sites-enabled/*.conf" >> /etc/httpd/conf/httpd.conf
fi

echo "create your virtual files in /etc/httpd/sites-available/domain.com.conf"
echo "create a symbolic link to activate."

