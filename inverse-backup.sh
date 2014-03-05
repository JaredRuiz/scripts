#!/bin/bash

## inverse-backup.sh
## The inverse of backup.sh; this takes 
#+ files contained in ~/.backups, or in some backup
#+ folder, and renames it according to its original name.
## Usage:
#+ inverse-backup.sh ~/.backups/file1 file2 ~/path/to/file3 
#+ inverse-backup.sh ~/.backups/file1 file2 ~/path/to/file3 dir

CURRENT_DIRECTORY=$(printf '%q/\n' ${PWD} ); # full path name

if [ $# -gt 0 ]; then  # if arguments exits
    ARRAY_LENGTH=$#;
    LAST_ARG=${!#};

    if [ -d $LAST_ARG ] ; then # if the last argument is a directory..
        # TODO: check if last arg has a '/' on it
        PASTE_DIRECTORY=$LAST_ARG;
	      ARGS=${@:1:$ARRAY_LENGTH-1}; # use all but last argument

    else # write files to current directory
	      PASTE_DIRECTORY=$CURRENT_DIRECTORY;
	      ARGS=${@:1:$ARRAY_LENGTH}; # use all arguments
    fi        

    for i in $ARGS; do
        if [ -f $i ]; then
            TEMP_FILE_NAME=$(echo ${i##*/});
            NEW_FILE_NAME=$(echo $TEMP_FILE_NAME | sed s/"\_BAK\_[A-Za-z0-9:-]\{1,\}"//);
            echo $PASTE_DIRECTORY$NEW_FILE_NAME;
            # cp $i $PASTE_DIRECTORY$NEW_FILE_NAME;

        fi
    done
fi
        
        
