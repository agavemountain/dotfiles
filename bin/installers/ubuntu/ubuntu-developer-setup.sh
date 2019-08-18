#!/bin/bash
#
# Setup ubuntu developer tools on newly provisioned
# system.  This sets up the basic tools needed to do development
#
# Written by Joe Turner <joe@agavemountain.com>
#

sudo apt update
sudo apt upgrade

# install prequisites
sudo apt install curl  -y

# if the visual studio code repository hasn't been setup
# set up
if [ ! -f /etc/apt/trusted.gpg.d/microsoft.gpg ]; then
    echo "Setting up Visual Studio Repository..."
    curl https://packages.microsoft/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
    sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
    sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

    # install it. 
    sudo apt-get update
    sudo apt-get install code # or code-insiders
fi

#install git subversion and CVS
sudo apt-get install git subversion cvs -y 

# install build essentials and python
sudo apt-get install build-essential checkinstall -y
sudo apt-get install python-dev python-pip python-virtualenv python-numpy python-matplotlib -y
sudo apt install  gawk gettext flex bison indent texinfo -y
sudo apt-get install libc6-dev libtool sharutils libncurses5-dev libgmp3-dev libmpfr-dev gperf libgtk2.0-dev libgtk2.0-bin \
libsdl1.2-dev swig python-dev texlive-latex3 texlive-extra-utils binutils-dev automake guile-1.8 icon-naming-utils \
libdbus-glib-1-dev wget gtk-doc-tools libxml-parser-perl zip unzip ecj fastjar x11-xkb-utils libglade2-dev \
libperl-dev python-libxml2 libexpat1-dev gconf2 groff tftp xinetd tftpd cifs-utils minicom cvs doxygen \
nfs-kernel-server gnome-panel xutils-dev sshpass libusb-1.0-0-dev devscripts debhelper -y

# unit test frameworks.
echo "Installing UNIT test frameworks..."
sudo apt-get install cpputest -y
sudo apt-get install libcppunit-dev

# install cmake
sudo apt install cmake -y

# install screen
sudo apt install screen -y 

# install jdk
sudo apt install openjdk-8-jdk 

# install maven
sudo apt install maven

sudo apt-get update
