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
E_FILE_ALREADY_EXISTS_ERR=65
E_NO_FILE_ERR=64

# save the name of the current directory
CURRENT_DIRECTORY=$(printf '%q/\n' ${PWD} );

# if no arguments exist..
if [ $# -eq 0 ]; then  
    echo "Usage: `echo ${0##*/}` path/to/backup/file backup_file"
    echo "OR"
    echo "Usage: `echo ${0##*/}` path/to/backup/file backup_file directory-to-place-new-file(s)"
    exit $E_NO_FILE_ERR
fi

ARRAY_LENGTH=$#;
LAST_ARG=${!#};

# if the last argument is a directory..
if [ -d $LAST_ARG ] ; then 
    PASTE_DIRECTORY=$LAST_ARG;
    # use all but last argument below
	  ARGS=${@:1:$ARRAY_LENGTH-1}; 

else
    # write files to current directory
	  PASTE_DIRECTORY=$CURRENT_DIRECTORY;
	  ARGS=${@:1:$ARRAY_LENGTH}; # use all arguments
fi        

for i in $ARGS; do
    # check to make sure i is a regular file (ie. not a directory)
    if [ -f $i ]; then 
        # grab the file's basename
        TEMP_FILE_NAME=$(echo ${i##*/});
        
        # strip off "_BAK_" and the time signature (ie. the file has the name it began with)
        NEW_FILE_NAME=$(echo $TEMP_FILE_NAME | sed s/"\_BAK\_[A-Za-z0-9:-]\{1,\}"//);

        source utility-functions.sh
        FINAL_FILE_NAME=$(combine-string-and-directory $NEW_FILE_NAME $PASTE_DIRECTORY)
        # don't use safe-copy, since there's no need to backup a backup
        cp $i $FINAL_FILE_NAME
    fi
done

exit 0
