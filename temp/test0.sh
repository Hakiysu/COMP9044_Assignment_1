#!/bin/dash
#
# Test mygive-add creates correct submission directory

rm -rf .mygive 

echo "Testing: mygive-add test1 testFile.txt"
./mygive-add test1 testFile.txt

if [ ! -d ".mygive/assignments/test1" ]; then
    echo "FAILED: Directory .mygive/test1 does not exist."
    exit 1
fi
echo "SUCCESS: Directory .mygive/test1 created."

echo "Testing: mygive-add test2 testFile.txt"
./mygive-add test2 testFile.txt
if [ ! -d ".mygive/assignments/test2" ]; then
    echo "FAILED: Directory .mygive/test2 does not exist."
    exit 1
fi
echo "SUCCESS: Directory .mygive/test2 created."

# parameter check
echo "Testing: mygive-add with no parameters"
./mygive-add
if [ $? -ne 1 ]; then
    echo "FAILED: mygive-add did not return error code 1 for no parameters."
    exit 1
fi
echo "SUCCESS: mygive-add returned error code 1 for no parameters."
