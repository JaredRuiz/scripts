#!/bin/sh

###############################
# backup.sh
# Backs up inputted file(s) in ~/.backups

BACKUP_DIRECTORY=~/.backups;
NOW=$(date +"%m-%d-%y-%T");

if [ $1 ]; then  # if arguments exist
    for i # loop through arguments
    do
      cp $i $i\_BAK_$NOW
      mv $i\_BAK_$NOW $BACKUP_DIRECTORY;
    done
fi


##Additional ideas...
##perhaps check if last argument is a folder, and if so, put the file there
