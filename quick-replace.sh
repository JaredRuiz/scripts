#!/bin/bash

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
