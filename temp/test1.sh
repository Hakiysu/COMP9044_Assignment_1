#!/bin/dash
#
# submit

rm -rf .mygive 

echo "Testing: Submitting test1"
./mygive-add test1 testFile.txt
./mygive-submit test1 z1234567 testFile.txt

if [ ! -d ".mygive/submissions/test1/z1234567/1" ]; then
    echo "FAILED: Submission directory not created"
    exit 1
fi
# Check if the file was copied correctly
if [ ! -f ".mygive/submissions/test1/z1234567/1/testFile.txt" ]; then
    echo "FAILED: testFile.txt not copied to submission directory"
    exit 1
fi
echo "PASSED: Submission test1 successful"

./mygive-submit test2 z1234567 testFile.txt
#should fail because test2 does not exist
if [ -d ".mygive/submissions/test2/z1234567/1" ]; then
    echo "FAILED: Submission to non-existent test2 should not create directory"
    exit 1
fi
echo "PASSED: Submission to non-existent test2 correctly failed"


# submit a file that does not exist
./mygive-add test2 testFile.txt
./mygive-submit test2 z1234567 nonExistentFile.txt
if [ -f ".mygive/submissions/test2/z1234567/1/nonExistentFile.txt" ]; then
    echo "FAILED: Submission of non-existent file should not create file in submission directory"
    exit 1
fi
echo "PASSED: Submission of non-existent file correctly failed"