#!/bin/bash

## display-between.sh
## A basic sed command; this takes two patterns and a file;
#+ and displays all text between the patterns.
## Usage: display-between pattern1 pattern2 file

if [ $# -eq 3 ]; then

    sed -n '/'$1'/,/'$2'/p' $3
fi

exit 0
