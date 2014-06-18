#!/bin/bash

E_NO_FILE_ERR=64

if [ $# -eq 1 ]
then
    # backup the given document
    ~/gitrepos/scripts/backup.sh $1;

    # make a temporary file
    NEWFILE=temp_\$1;

    while read LINE; do
        echo $LINE >> $NEWFILE
    done

    # replace $1 and remove temporary file
    cat $NEWFILE > $1;
    rm $NEWFILE;

else
    echo "first arg must be a regular file that already exists"
    exit $E_NO_FILE_ERR
fi

exit 0
