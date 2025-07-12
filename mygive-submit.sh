#!/bin/dash
#
# Makes a submission for the assignment by a student
# example: mygive-submit <assignment> <zid> <filename>

if [ ! -d "/.mygive" ]; then
    echo "mygive-submit: mygive directory .mygive not found"    
fi
# check command if legal
if [ $# -ne 3 ]; then
    echo "usage: mygive-submit <assignment> <zid> <filename>"
    exit 1
fi