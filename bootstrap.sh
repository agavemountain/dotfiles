#!/bin/bash


function copyBin() {
	mkdir -p $HOME/bin
	rsync --exclude ".DS_Store" -avh --no-perms bin $HOME;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	copyBin;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		copyBin;
	fi;
fi;

unset copyBin;