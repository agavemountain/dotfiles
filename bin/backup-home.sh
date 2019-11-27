#!/bin/bash
#
# backup home directory to the specified destination
#
NOW=$(date +"%m-%d-%Y")
DEST=~/nas/DATA/backups/backup-home-$USER-$NOW

echo "backing up $HOME to: $DEST"

mkdir -p $DEST

sudo rsync -aAXv $HOME --exclude={"$HOME/nas/*"} $DEST
