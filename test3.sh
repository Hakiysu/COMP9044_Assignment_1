#!/bin/dash
#
# fetch

rm -rf .mygive

echo "Testing: fetch a submission"
echo "TEST">> testFile.txt
./mygive-add test1 testFile.txt
echo "TEST3">> testFile1.txt
./mygive-submit test1 z1234567 testFile1.txt

rm -rf testFile1.txt

output=$(./mygive-fetch test1 z1234567)
if [ "$output" = "TEST3" ]; then
    echo "Test passed"
else
    echo "Test failed"
    echo "File content mismatch, expected 'TEST3' but got '$output'"
fi


#try to fetch a non-existent submission
output=$(./mygive-fetch test5 z1234567)
if [ "$output" = "No submissions found for zid: z1234567" ]; then
    echo "Test passed for non-existent submission"
else
    echo "Test failed for non-existent submission"
    echo "ERROR msg: '$output'"
fi