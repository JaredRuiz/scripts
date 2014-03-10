#!/bin/bash

## rename.sh
## A safer and smarter mv command. 'Move' is a misnomer;
#+ the mv command really acts like a rename command (hence the name of this script).
#+ In this script, files are automatically backed up before being 'moved', 
#+ and no clobber is automatically set so that no data is ever lost.

E_ARG_ERR=66
E_NO_FILE_ERR=64

if [ $# -eq 2 ]
then 
    # first, make sure input file exists, and is not a directory
    if [ -f $1 ]
    then
    # backup the input file
    ~/gitrepos/scripts/backup.sh $1 ~/.backups/mvBackups

    # move the file, but don't overwrite an existing file
    mv -n $1 $2
    
    else
        echo "first arg must be a regular file that already exists"
        exit $E_NO_FILE_ERR
    fi
    
else
    ## plan something if there are more than two arguments
    echo "Usage: `echo ${0##*/}` file-to-move new-file"
    exit $E_ARG_ERR
fi

exit 0
    
