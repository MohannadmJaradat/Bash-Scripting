#!/bin/bash

# Print current date and time
echo "System Statistics - $(date)"
echo "------------------------"

# Number of logged in users
echo "Logged in users: $(who | wc -l)"

# System uptime
echo "Uptime: $(uptime -p)"

# Memory usage
echo -e "\nMemory Usage:"
free -h | grep "Mem:"

# Disk usage
echo -e "\nDisk Usage:"
df -h / | tail -n 1

# CPU usage
echo -e "\nCPU Usage:"
top -bn1 | grep "Cpu(s)" | awk '{print $2}' | awk -F. '{print $1}' | xargs -I{} echo "{}%"

# Load average
echo -e "\nLoad Average: $(uptime | awk -F'load average:' '{print $2}')"

# Most memory-intensive processes
echo -e "\nTop 3 Memory-Intensive Processes:"
ps aux --sort=-%mem | head -4 | tail -3