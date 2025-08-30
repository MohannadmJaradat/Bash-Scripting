#!/bin/bash

filename=/home/mohannad/Desktop/hello.txt

while [ -f ${filename} ]
do
    echo "The test file exists."
    sleep 3.0
done

echo "The file no longer exists. Exiting."