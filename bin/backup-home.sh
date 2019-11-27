#!/bin/bash
#
# backup home directory to the specified destination
#
# This is a quick and dirty script to backup my home directory
# before I nuke this machine and install a fresh copy of 
# a different OS.
#

NOW=$(date +"%m-%d-%Y")
DEST=~/nas/DATA/backups/backup-home-$USER-$NOW

echo "backing up $HOME to: $DEST"

mkdir -p $DEST

sudo rsync -aAXv $HOME --exclude="nas/*" --exclude="Downloads/*" \
    --exclude=".cache/*" --exclude=".caches/*" \
    --exclude=".config/*" --exclude ".hunter/*" \
    --exclude=".linuxbrew/*" --exclude=".local/*" \
    --exclude=".p2/*" --exclude=".mozilla/*" --exclude=".m2/*" \
    --exclude=".eclipse/*"  --exclude=".npm/*" --exclude=".vscode/*" \
    $DEST
