#!/bin/bash

SUBJECT=`awk '/Subject: / {print $2}' Stroop.txt | uniq`
SESSION=`awk '/Session: / {print $2}' Stroop.txt | uniq`

#echo $SUBJECT
#echo $SESSION

echo "$SUBJECT $SESSION"
echo "$SUBJECT $SESSION"
