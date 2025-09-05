# Generate a list of unique logged in names in sorted order

#!/bin/bash
who |  awk '{ print $1 }' | sort | uniq
