#!/bin/bash

## rename.sh
## A safer and smarter mv command

if [ $# -eq 2 ]; then 
    
    # first, make sure input file exists, and is not a directory
    if [ -f $1 ]; then
    # backup the input file
    ~/gitrepos/scripts/backup.sh $1 ~/.backups/mvBackups

    # move the file, but don't overwrite an existing file
    mv -n $1 $2
    
    else
        echo "first arg must be a regular file that already exists"
        exit
    fi
    
else
    ## plan something if there are more than two arguments
    echo "exactly two arguments must be given"
    exit
fi

exit 0
    
