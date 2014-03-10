#!/bin/bash

## inverse-backup.sh
## The inverse of backup.sh; this takes 
#+ files contained in ~/.backups, or in some backup
#+ folder, and renames it according to its original name, 
#+ ie. it strips off the _BAK_TIMESIGNATURE
## Usage:
#+ inverse-backup.sh ~/.backups/file1 file2 ~/path/to/file3 
#+ inverse-backup.sh ~/.backups/file1 file2 ~/path/to/file3 dir

E_ARG_ERR=66
E_NO_FILE_ERR=64

# save the name of the current directory
CURRENT_DIRECTORY=$(printf '%q/\n' ${PWD} );

# TODO: THIS IS STILL NOT SAFE!!!!!! IT MAY OVERWRITE A FILE IN THE CURRENT DIRECTORY IF THE NAMES ARE THE SAME!!!!


if [ -z $1 ]; then  # if arguments exits
    echo "Usage: `echo ${0##*/}` path/to/backup/file backup_file"
    echo "OR"
    echo "Usage: `echo ${0##*/}` path/to/backup/file backup_file directory-to-place-new-file(s)"
    exit
fi

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

exit 0
