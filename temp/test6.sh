#!/bin/dash
#
# fetch update ver

rm -rf .mygive

echo "Testing: fetch overwrite"

echo "ver" > testfile.txt

./mygive-add test1 testfile.txt
./mygive-submit test1 z1234567 testfile.txt

echo "1" > testfile.txt

content=$(./mygive-fetch test1 z1234567 )


if [ "$content" = "ver" ]; then
    echo "Test passed: fetch did not overwrite file as expected, content is still: $content"
    exit 1
else
    echo "Test failed: fetch overwrote file, content is now: $content"
    exit 0
fi