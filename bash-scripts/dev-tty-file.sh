#!/bin/bash

# /dev/tty stands for teletype, which was the original kind of terminal that
# unix developers had. /dev/tty is important if you which to communiacate
# directly with your user. This file demonstrates how you can prompt the
# user to enter a password using /dev/tty file.

pass=x pass2=y
until [ "${pass}" = "${pass2}" ]
do
    stty -echo # Turn off echoing
    printf "Enter new password: "
    read pass < /dev/tty
    printf "\nEnter again: "
    read pass2 < /dev/tty
    stty echo
    echo 
    if [ "${pass}" = "${pass2}" ]
    then
        echo "Passwords match"
    else
        echo "Passwords don't match"
    fi
done