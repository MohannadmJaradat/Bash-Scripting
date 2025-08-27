#!/bin/bash

directory=/etc

if [ -d ${directory} ]
then
    echo "The exit code for this script run is $?"
    echo "The directory ${directory} exists."
else 
    echo "The exit code for this script run is $?"
    echo "The directory ${directory} doesn't exists."
fi