#!/bin/bash

# Basic setup
SCRIPTS="bash-scripts"
VER="0.1"

# Scripts registry
REGISTRY=(
  "system-stats.sh:System monitoring"
  "hello-world.sh:Basic test"
  "date.sh:Time info"
  "variable.sh:Variable demo"
)

# Colors for output
R='\033[0;31m'
G='\033[0;32m'
N='\033[0m'

# Run script
_run() {
  local s="$SCRIPTS/$1"
  echo -e "${G}▶ Running $1...${N}"
  chmod +x "$s" && "./$s"
  echo -e "${G}✓ Done${N}\n"
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
    [1-9]) 
      if [[ $choice -le ${#REGISTRY[@]} ]]; then
        _run "${REGISTRY[$choice-1]%%:*}"
      fi
      ;;
  esac
  read -p "Press enter to continue"
done