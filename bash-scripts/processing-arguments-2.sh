#! /bin/bash

# Process arguments using a for loop.

echo Processing $# arguments

count=1
for i # default is for in in "$@"
do
    echo "Argument \"${count}\": \"${i}\""
    ((count++))
done
