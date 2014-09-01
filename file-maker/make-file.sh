#!/bin/sh

E_ARG_ERR=66
E_FILE_ALREADY_EXISTS_ERR=65
E_NO_FILE_ERR=64

if [ -e $2 ]; then
    echo "error: file $2 already exists..exiting"
    exit E_FILE_ALREADY_EXISTS_ERR
else
    # make NEW_FILE


    EXT=$1
    FILE_NAME=$2
    NEW_FILE="$FILE_NAME.$EXT"

    case "$EXT" in

    "js")
        # EXAMPLE_FILE=
        ;;
    "tex")
        # EXAMPLE_FILE=
        ;;
    "cpp")
        # EXAMPLE_FILE=
        ;;
    "sh")
        EXAMPLE_FILE=~/gitrepos/scripts/file-maker/samples/sample.sh
        ;;
    esac

    touch $NEW_FILE
    cat $EXAMPLE_FILE > $NEW_FILE
fi

exit 0
