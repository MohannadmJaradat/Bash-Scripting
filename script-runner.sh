#!/bin/bash

# Basic setup
SCRIPTS="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/bash-scripts"
VER="0.1"

# Scripts registry
REGISTRY=(
  "system-stats.sh:System monitoring"
  "hello-world.sh:Basic test"
  "date.sh:Time info"
  "variable.sh:Variable demo"
  "if-statement-1.sh:If statement minimal test"
  "if-else-statement-1.sh:If-else statement minimal test"
  "if-statement-2-check-files.sh:check if a certain file exists"
  "if-else-statement-check-command.sh:check whether command exists"
  "if-else-statement-using-command-v.sh:Using command -v"
  "exit-codes-1.sh:Check whether htop is installed using exit codes."
  "exit-codes-2.sh:Redirecting output to log files."
  "exit-codes-3.sh:Check whether directory exists."
  "exit-codes-4.sh:Manipulate exit codes."
  "while-loops-1.sh:Simple while loop."
  "while-loop-2.sh:Continuously check whether a file exists."
  "universal-update.sh:Update linux distro."
  "for-loop-1.sh:Simple for loop."
  "for-loop-2.sh:Archive files in a certain directory."
  "stdin.sh:Accept input from user."
  "case-statement-1.sh:Choosing a linux distro using switch statement."
  "case-statement-2.sh:Choosing a linux distro using switch statement and while loop."
  "schedule-job-1.sh:Test running this using 'at' command."
  "argument1.sh:Argument demonstration."
  "argument2.sh:Count the number of objects in a directory."
  "backup.sh:Backup script."
  "login-names.sh:Generate a list of unique logged in names in sorted order"
  "processing-arguments-1.sh:Using while loop and shift command."
  "processing-arguments-2.sh:Using for loop."
  "reading-from-file.sh:Parses contents of a file."
)

# Colors for output
R='\033[0;31m'
G='\033[0;32m'
N='\033[0m'

# Run script
_run() {
  local s="$SCRIPTS/$1"
  if [ -f "$s" ]; then
    echo -e "${G}▶ Running $1...${N}"
    chmod +x "$s" && "$s"
    echo -e "${G}✓ Done${N}\n"
  else
    echo -e "${R}Error: Script $1 not found${N}"
    echo "Looking in: $s"
  fi
}

# Show menu
_menu() {
  clear
  echo "Select script to run:"
  echo "-------------------"
  echo "0) Run all"
  local i=1
  for entry in "${REGISTRY[@]}"; do
    name="${entry%%:*}"
    desc="${entry#*:}"
    echo "$i) $name - $desc"
    ((i++))
  done
  echo "q) Quit"
}

# Main loop
while true; do
  _menu
  read -p "> " choice
  
  case $choice in
    q) exit 0 ;;
    0) 
      for entry in "${REGISTRY[@]}"; do
        _run "${entry%%:*}"
      done
      ;;
    [1-9]* )  # Changed from [1-9] to [1-9]* to match any number starting with 1-9
      if [[ $choice -le ${#REGISTRY[@]} ]]; then
        _run "${REGISTRY[$choice-1]%%:*}"
      else
        echo -e "${R}Invalid choice: $choice${N}"
      fi
      ;;
    *)
      echo -e "${R}Invalid choice: $choice${N}"
      ;;
  esac
  read -p "Press enter to continue"
done