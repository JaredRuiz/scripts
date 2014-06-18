#!/bin/bash

# TEST_STRING="/poop/fart/shit/";

ARG=$2

TEST_STRING=$(~/gitrepos/scripts/create-filename-with-directory.sh $1 $ARG)
# TEST_STRING=$(~/gitrepos/scripts/create-filename-with-directory.sh $1 $2)
echo $TEST_STRING

