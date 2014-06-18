#!/bin/bash

###############################
# backup.sh
## Backs up inputted file(s) in ~/.backups, 
#+ or the final argument, if that is a directory
## Usage:
#+ backup.sh file1 file2 file3
#+ backup.sh file1 file2 dir 

# timestamp will be displayed on the backup file
NOW=$(date +"%m-%d-%y-%T");

if [ $# -gt 0 ]; then  # if arguments exits
    ARRAY_LENGTH=$#;
    LAST_ARG=${!#};

    if [ -d $LAST_ARG ] ; then # if the last argument is a directory..
	      BACKUP_DIRECTORY=$LAST_ARG; # then make it the backup directory
	      ARGS=${@:1:$ARRAY_LENGTH-1}; # use all but last argument

    else # otherwise store files in designated backup folder
	      BACKUP_DIRECTORY=~/.backups;
	      ARGS=${@:1:$ARRAY_LENGTH}; # use all arguments
    fi

    # loop through the arguments
    for i in $ARGS; do 
        # if file is not a directory or anything special
	      if [ -f $i ]; then 
	          cp $i $i\_BAK_$NOW
	          mv $i\_BAK_$NOW $BACKUP_DIRECTORY;
	      fi
    done
fi

exit 0
