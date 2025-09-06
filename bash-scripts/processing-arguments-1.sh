#! /bin/bash

# Process arguments using a while loop.

echo Processing $# arguments

count=1
while [ $# -gt 0 ]
do
    echo "Argument ${count}: ${1}"
    ((count++))
    shift
done
