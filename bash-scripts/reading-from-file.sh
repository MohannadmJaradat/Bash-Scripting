#!/bin/bash

desktop=/home/mohannad/Desktop

Mail (){
    echo Mail "$@"
    cat
    echo
    echo =========================
    echo
}

IFS=: # stands for "input file separator", sets the input file separator to :
while read name amount email
do
    Mail -s 'Late payment due' "${email}" << EOF # mail with a subject line of "late payment due"
        Dear $name,

        As of $(date '+%B %-d, %Y'), you still owe us \$${amount}.
        Please send payment immediately.

        Sincerely,

        Mohannad Jaradat
EOF

done < ${desktop}/payments-due.txt 
# We placed the input redirection here because if we placed it on line 12 it
# would happen on each iteration of the loop which would cause an infinite loop. 

# The contents of payments-due.txt must follow this format
# Ahmad Ali:30.20:ahmad.ali@example.com