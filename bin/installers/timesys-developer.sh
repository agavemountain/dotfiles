#!/bin/bash 
#
# Install tools for timesys vybrid development
#
#

# install a package if not already installed
function install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    sudo apt install -y $1
  else
    echo "Already installed: ${1}"
  fi
}

install git
install curl
install dialog
