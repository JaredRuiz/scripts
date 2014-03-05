#!/bin/bash

## inverse-backup.sh
## The inverse of backup.sh; this takes 
#+ files contained in ~/.backups, or in some backup
#+ folder, and renames it according to its original name, 
#+ ie. it strips off the _BAK_TIMESIGNATURE
## Usage:
#+ inverse-backup.sh ~/.backups/file1 file2 ~/path/to/file3 
#+ inverse-backup.sh ~/.backups/file1 file2 ~/path/to/file3 dir

# save the name of the current directory
CURRENT_DIRECTORY=$(printf '%q/\n' ${PWD} );

if [ $# -gt 0 ]; then  # if arguments exits
    ARRAY_LENGTH=$#;
    LAST_ARG=${!#};

    if [ -d $LAST_ARG ] ; then # if the last argument is a directory..
        PASTE_DIRECTORY=$LAST_ARG;
	      ARGS=${@:1:$ARRAY_LENGTH-1}; # use all but last argument

    else # write files to current directory
	      PASTE_DIRECTORY=$CURRENT_DIRECTORY;
	      ARGS=${@:1:$ARRAY_LENGTH}; # use all arguments
    fi        

    for i in $ARGS; do
        if [ -f $i ]; then # check to make sure its a regular file
            # grab the file's basename
            TEMP_FILE_NAME=$(echo ${i##*/});
            
            # strip off _BAK_TIMESIGNATURE
            NEW_FILE_NAME=$(echo $TEMP_FILE_NAME | sed s/"\_BAK\_[A-Za-z0-9:-]\{1,\}"//);
            if grep -q "/$" <<< $PASTE_DIRECTORY; # if PASTE_DIRECTORY ends with '/'
            then
                cp $i $PASTE_DIRECTORY$NEW_FILE_NAME;
            else
                cp $i $PASTE_DIRECTORY/$NEW_FILE_NAME;
            fi
        fi
    done
else
    echo "no arguments were given"
    exit
fi
        
exit 0
