#!/bin/bash

# Check if an argument is provided
if [ -z "$1" ]; then
  echo "Please provide a string to analyze."
  exit 1
fi

# Input string
input="$1"

# Initialize counters
letters=0
numbers=0
symbols=0

# Loop through each character in the string
for (( i=0; i<${#input}; i++ )); do
  char="${input:$i:1}"
  
  # Check for letters
  if [[ "$char" =~ [a-zA-Z] ]]; then
    ((letters++))
  
  # Check for numbers
  elif [[ "$char" =~ [0-9] ]]; then
    ((numbers++))
  
  # Check for symbols, escaping special characters like # and others
  elif [[ "$char" =~ [\*\!\@\#\$\%\^\&\(\)\_\+] ]]; then
    ((symbols++))
  fi
done

# Output the counts
echo "Numbers: $numbers Symbols: $symbols Letters: $letters"
