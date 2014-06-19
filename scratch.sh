#!/bin/bash


ARG1=$1
ARG2=$2

source utility-functions.sh

NEW_FILE=$(combine-filename-and-directory $ARG1 $ARG2)

echo $NEW_FILE

