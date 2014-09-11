#!/bin/bash

E_ARG_ERR=66
E_FILE_ALREADY_EXISTS_ERR=65
E_NO_FILE_ERR=64

function combine-string-and-directory() {
    if [ $# -eq 2 ]; then  
        ## if the second arg is a directory
        if [ -d $2 ]; then 

            if grep -q "/$" <<< $2;
            then
                # don't add an extra "/" if PASTE_DIRECTORY already ends with one
                echo $2$1;
            else
                # add the "/" if its not already present
                echo $2/$1;
            fi
            
        else
            exit $E_ARG_ERROR
        fi

    else
        exit $E_NO_FILE_ERR
    fi
}

# capitalizes first letter of a bunch of words
function capitalize-first-letter-only() {
    echo $1 | tr [A-z] [a-z] | sed 's/^./\U&/g' | sed 's/[[:space:]]./\U&/g'
}


function surround-text-in-quotes() {
    sed -e "s/\(.*\)/'\1'/"
}
