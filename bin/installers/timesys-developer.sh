#!/bin/bash 
#
# Install tools for timesys vybrid development
#
#

sudo apt-get update

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

function fetch_timesys {
    curl https://github.com/PeopleNet/pmg-rfs-packages/releases/download/0.0.1/twr_vf600-development-environment.sh
}

install git
install curl
install dialog
install build-essential
install checkinstall
install gawk
install gettext
install flex
install bison 
install indent
install texinfo

install cpputest
install libcppunit-dev
install cmake
install build-dep 
install libncurses-dev 
install openssl-dev 
install libssl-dev 
install dkms 
install libelf-dev

install libc6-dev-i386 
install lib32z1 
install lib32ncurses5

install xutils-dev
install devscripts
install dh-make
install libcurl4-openssl-dev
install libusb-dev

# for building u-boot
install u-boot-tools

# device trees
install device-tree-compiler




