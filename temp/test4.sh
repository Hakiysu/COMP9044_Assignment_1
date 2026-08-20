#!/bin/dash
#
# status/submit

rm -rf .mygive

echo "Testing mygive status with no submissions"

echo "Text1"> testFile.txt
./mygive-add test1 testFile.txt

output=$(./mygive-status z1234567)
expected_output="no submissions for z1234567"

if [ "$output" = "$expected_output" ]; then
    echo "Test passed: mygive-status with no submissions"
else
    echo "Test failed: mygive-status with no submissions"
    echo "Expected: $expected_output"
    echo "Got: $output"
fi

./mygive-submit test1 z1234567 testFile.txt
output=$(./mygive-status z1234567)
if [ $?=0 ]; then
    echo "Test passed"
else
    echo "Test failed"
fi