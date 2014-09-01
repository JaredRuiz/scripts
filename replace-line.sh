#!/bin/bash

## replace-line
## Jared Ruiz
## Description: Replaces line of file with user-selected input
## Args: 
#+ arg1: line number
#+ arg2: file name
#+ arg3: string to place
## Usage:
#+ ./replace-line num file-name "this string should go in line num of file-name"

## Common Errors
ARG_ERR=66  # incorrect number of args
FILE_ALREADY_EXISTS_ERR=65
NO_FILE_ERR=64
OUT_OF_BOUNDS_ERROR=67

LINE_NUM=$1
FILE=$2

NUMBER_OF_LINES=cat $FILE | wc -l

if [ $LINE_NUM -ge $NUMBER_OF_LINES ]; then 
    echo "line numbers are off"
    exit $OUT_OF_BOUNDS_ERROR
else
    LINE_BEFORE=0
    LINE_AFTER=0
    (( LINE_BEFORE=LINE_NUM -= 1 ))
    (( LINE_AFTER=NUMBER_OF_LINES - LINE_NUM ))
    touch temp_replace-line_file
    cat $FILE | head -$LINE_BEFORE >> temp_replace-line_file
    cat $3 >> temp_replace-line_file
    cat $FILE | tail -$LINE_AFTER >> temp_replace-line_file
    cat temp_replace-line_file > $FILE
    rm temp_replace-line_file
fi

exit 0
