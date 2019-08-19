#!/bin/bash

sudo apt-get build-dep 
# linux-image-$(uname -r)
sudo apt-get install libncurses-dev flex bison openssl-dev libssl-dev dkms libelf-dev

# for building u-boot
sudo apt-get install u-boot-tools

# device trees
sudo apt-get install device-tree-compiler
