#!/bin/sh

#########################
##list-folder.sh

## Lists the folders of the current directory,
#+ or of the given directories 
## Usage: list-folder.sh OR list-folder.sh dir1 dir2

## TODO: add better color support

ls -F --color=auto $@ | grep \/ --color=auto
