#!/bin/dash
#
# rm

rm -rf .mygive

echo "Testing: remove assignment which not exists"


echo "Test1">testFile.txt
echo "Test2">testFile2.txt

./mygive-add test1 testFile.txt

output=$(./mygive-rm test111)
if [ "$output" = "assignment test111 does not exist" ]; then
    echo "Test passed: correct error message for non-existent assignment"
else
    echo "Test failed: '$output'"
    exit 1
fi