#!/bin/bash

## safe-copy.sh
## This is a safer version of cp:
#+ it backs up the first argument, and does not overwrite the 
#+ second argument if it already exists
## Usage:
#+ safe-copy.sh file1 file2

E_ARG_ERR=66
E_FILE_EXISTS_ERR=64

if [ $# -eq 2 ]; then 
    # check to make sure first argument is a regular file
    if [ -f $1 ]; then 
        # if the first argument already exists
        if [ -e $2 ]; then
            echo "error: $2 already exists. Closing `echo ${0##*/}`"
            exit $E_FILE_EXISTS_ERR
        else
            ~/gitrepos/scripts/backup.sh $1
            cp $1 $2
        fi
    fi
else 
    echo "copy accepts two arguments:"
    echo "there are $# arguments"
    echo "Usage: `echo ${0##*/}` file_to_copy new_file_name"
    exit $E_ARG_ERR
fi

exit 0
