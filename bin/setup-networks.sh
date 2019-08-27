#!/bin/bash
#
# This file contains information to alias an ethernet
# nic to an additional network.  A far better method, but
# when you are cheap or working around restrictive IT departments,
# sometimes you have to make due.
#
# 

if [ -f "$HOME/.networks" ]; then
    echo "Setting up network aliases"
    $HOME/.networks
else
    echo "No network setup file found.  Create a .networks script in"
    echo "your home directory with commands to bring up/down or alias"
    echo "ethernet nics, wifi APs, etc."
fi