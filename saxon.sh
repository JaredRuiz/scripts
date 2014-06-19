#!/bin/bash


if [ $# -gt 0 ]; then
    if [ $# -eq 2 ]; then
        saxonb-xslt -s:$1 -xsl:$2
        exit 0
    else
        saxonb-xslt -s:$1 -xsl:$2 -o:$3
        exit 0
    fi
fi




