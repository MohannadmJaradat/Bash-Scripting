#!/bin/bash

# Describe commands: Demonstrate the different kinds of commands.                                                                                                                   differenct kinds of commands

count_unique_users (){
    who | awk '{ print $1 }' | sort -u | wc -l
}

for in in cd read pwd \
    test printf \
    count_unique_users \
    ls who sort
do
    type $i # built-in command describing other commands
done

# some commands are built in to the shell because they have to be, like 
# cd and read, other commands are built in to the shell for performnce reasons
# such as pwd, test, and printf. count_unque_users is a shell function, 
# and ls, who, and sort live in the file system along with the full path to them.
