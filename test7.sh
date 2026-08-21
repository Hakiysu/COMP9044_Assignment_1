#!/bin/dash
#
# status a non-existent assignment

rm -rf .mygive

echo "test" > testfile.txt


./mygive-add test1 testfile.txt
output=$(./mygive-status z1234567)
if [ "$output" = "no submissions for z1234567" ]; then
    echo "Test passed: status of non-existent assignment"
else
    echo "Test failed: expected 'assignment test1 does not exist', got '$output'"
    exit 1
fi

./mygive-submit test1 z1234567 testfile.txt

output=$(./mygive-status z1234567)
if [ "$output" != "no submissions for z1234567" ]; then
    echo "Test passed: status after submit on non-existent assignment"
    echo "Output: $output"
else
    echo "Test failed, no submissions for z1234567"
    exit 1
fi