#!/bin/sh

for i in $@; do 
    cat $i | sed s/"[A-Z0-9]\{8\}\*." /1HGCM56693A070350/g | ~/gitrepos/scripts/quick-replace.sh $i;
    done;

exit 0
