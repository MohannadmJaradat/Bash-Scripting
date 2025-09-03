#!/bin/bash

finished=0

while [ ${finished} -ne 1 ]
do
    echo "What is your favorite Linux distributin?"

    echo "1 - Arch"
    echo "2 - CentOS"
    echo "3 - Debian"
    echo "4 - Mint"
    echo "5 - Ubuntu"
    echo "6 - Something else..."

    read distro;

    case ${distro} in 
        1) echo "Arch is a rolling release.";;
        2) echo "CentOS is popularo on servers.";;
        3) echo "Debian is a community distribution";;
        4) echo "Mint is popular on desktops and laptops.";;
        5) echo "ubuntu is popular on both servers and computers.";;
        6) echo "There are many distributions out there.";;
        7) finished=1;;
        *) echo "You didn't enter an appropriate choice."
    esac
done

echo "Thank you for using this script."
