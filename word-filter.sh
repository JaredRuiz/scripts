#! /bin/sh
# Read a text stream on standard input, and output a list of
# the n (default: 25) most frequently occurring words and
# their frequency counts, in order of descending counts, on
# standard output.
#
# Usage:
# wf [n]

tr -cs A-Za-z\' '\n' | #Replace nonletters with newlines
 tr A-Z a-z | #Map uppercase to lowercase
 sort | #Sort the words in ascending order
 uniq -c | #Eliminate duplicates, showing their counts
 sort -k1,1nr -k2 | #Sort by descending count, and then by ascending word
 sed ${1:-25}q #Print only the first n (default: 25) lines; see Chapter 3
