#!/bin/sh

E_ARG_ERR=66
E_FILE_ALREADY_EXISTS_ERR=65
E_NO_FILE_ERR=64

if [ -e $2 ]; do
    echo "error: file $2 already exists..exiting"
    exit E_FILE_ALREADY_EXISTS_ERR
else
    # make NEW_FILE
fi

EXT=$1


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
    # EXAMPLE_FILE=
    ;;
esac

touch $NEW_FILE
cat EXAMPLE_FILE > $NEW_FILE
exit 0
