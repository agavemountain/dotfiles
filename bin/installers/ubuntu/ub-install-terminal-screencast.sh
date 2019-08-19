#!/bin/bash

# add terminal recorder
sudo apt-get install imagemagick ttyrec gcc x11-apps -y

git clone https://github.com/icholy/ttygif.git
cd ttygif
make
sudo make install
