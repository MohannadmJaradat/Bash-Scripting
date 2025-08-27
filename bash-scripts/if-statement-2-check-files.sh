#!/bin/bash

flename="/home/mohannad/Desktop/clone.sh"

if [ -f ${filename} ]
then
    echo "The file ${filename} exists."
else
    echo "The file ${filename} does not exist."
fi
