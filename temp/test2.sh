#!/bin/dash
#
# summary

rm -rf .mygive 

echo "Testing: Summary of submissions"
./mygive-add test1 testFile.txt
./mygive-submit test1 z1234567 testFile.txt

output=$(./mygive-summary)
if [ "$output" = "assignment test1: submissions from 1 students" ]; then
    echo "Test passed"
else
    echo "Test failed"
    echo "Expected: assignment test1: submissions from 1 students"
    echo "Got: $output"
fi

# same assign, more than one student
./mygive-submit test1 z1234568 testFile.txt
./mygive-submit test1 z1234569 testFile.txt

output=$(./mygive-summary)
if [ "$output" = "assignment test1: submissions from 3 students" ]; then
    echo "Test passed"
else
    echo "Test failed"
    echo "Expected: assignment test1: submissions from 3 students"
    echo "Got: $output"
fi