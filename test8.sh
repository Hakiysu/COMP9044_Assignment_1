#!/bin/dash
#
# fetch others students

rm -rf .mygive

echo "fetching others' submissions"


echo "test" > testfile.txt
echo "tteesstt" > test1.txt

./mygive-add test1 testfile.txt

./mygive-submit test1 z1111111 testfile.txt

output=$(./mygive-fetch test1 z1111111)
echo $output
if [ "$output" = "test" ]; then
    echo "Test passed: fetch z1111111 own submission successful"
else
    echo "Test failed: fetch z1111111 own submission should return test"
fi

output=$(./mygive-fetch test1 z2222222) #z2222222 currently has no submission, so should return nothing
if [ "$output" = "tteesstt" ]; then
    echo "Test failed: fetch z2222222 should not return anything"
else
    echo "Test passed: fetch z2222222 returned nothing as expected"
fi

# Now submit a file for z2222222
./mygive-submit test1 z2222222 test1.txt
output=$(./mygive-fetch test1 z2222222)
if [ "$output" = "tteesstt" ]; then
    echo "Test passed: fetch z2222222 own submission successful"
else
    echo "Test failed: fetch z2222222 own submission should return tteesstt"
fi