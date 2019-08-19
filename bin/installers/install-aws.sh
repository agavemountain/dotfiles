#!/bin/bash

# Install AWS CLI
curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
unzip awscli-bundle.zip
sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
rm -rf ./awscli-bundle*

pip --version

# install dependency packages.
pip install --user --ignore-installed boto3 requests configparser bs4 nose tornado
