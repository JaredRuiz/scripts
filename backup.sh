#!/bin/sh

###############################
# backup.sh
# Backs up inputted file(s) in ~/.backups


NOW=$(date +"%m-%d-%y-%T");
LAST_ARG=${!#};

if [ $# -gt 0 ]; then  # if arguments exist

    if [ -d $LAST_ARG ] ; then # if the last argument is a directory
	ARG_ARRAY=( $@ );
	ARRAY_LENGTH=$#;
	ARGS=${ARG_ARRAY[@]:0:$ARRAY_LENGTH-1};
	BACKUP_DIRECTORY=$LAST_ARG; # then make it the backup directory
    else
	ARGS=( $@ );
	BACKUP_DIRECTORY=~/.backups;
    fi
    
    for i in $ARGS; do # loop through arguments
      cp $i $i\_BAK_$NOW
      mv $i\_BAK_$NOW $BACKUP_DIRECTORY;
    done
fi
