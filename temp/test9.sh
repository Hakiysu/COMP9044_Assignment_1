#!/bin/dash
#
# illegal parameters test

rm -rf .mygive


echo "Testing mygive commands with illegal parameters..."

echo "test">test.txt
echo "test2">test2.txt
echo "test3">test3.txt
./mygive-add test1 test.txt
./mygive-add test2 test2.txt

./mygive-submit test1 z1111111 test.txt
./mygive-submit test2 z2222222 test2.txt

# mygive-add
echo "Testing mygive-add with parameters..."
output=$(./mygive-add 321test test.txt)
if [ "$output" = "assignment 321test created" ]; then
    echo "Failed: this is illegal, mygive-add should not accept illegal input."
else
    echo "Passed: mygive-add correctly rejected illegal input."
fi

# mygive-status
echo "Testing mygive-status with parameters..."
output=$(./mygive-status a1234567)
if [ "$output" = "no submission for a1234567" ]; then
    echo "Failed: this is illegal, mygive-status should not accept illegal input."
else
    echo "Passed: mygive-status correctly rejected illegal input."
fi

# mygive-fetch
echo "Testing mygive-fetch with parameters..."
output=$(./mygive-fetch test1 z1111111)
if [ "$output" = "no submission for z1111111" ]; then
    echo "Failed: this is illegal, mygive-fetch should not accept illegal input."
else
    echo "Passed: mygive-fetch correctly rejected illegal input."
    echo "Output: $output"
fi

#fetch a invalid version input
echo "Testing mygive-fetch with invalid version input..."
output=$(./mygive-fetch test1 z1111111 a)
if [ "$output" = "no submission for z1111111" ]; then
    echo "Failed: this is illegal, mygive-fetch should not accept it."
else
    echo "Passed: mygive-fetch correctly rejected."
    echo "Output: $output"
fi