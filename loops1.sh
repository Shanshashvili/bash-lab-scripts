#!/bin/bash

# Check if argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <string>"
  exit 1
fi

# Input string from the argument
input="$1"

# Reverse the string and swap case
# Using 'rev' to reverse and 'tr' to swap case
result=$(echo "$input" | rev | tr 'a-zA-Z' 'A-Za-z')

# Output the result
echo "$result"

