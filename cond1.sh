#!/bin/bash

# Check if an argument is provided
if [ -z "$1" ]; then
  echo 0
  exit 0
fi

# Input list passed as a string
input="$1"

# Convert the input string into an array using ',' as a delimiter
IFS=',' read -r -a numbers <<< "$input"

# Initialize sum
sum=0

# Loop through the array and sum up the even numbers
for num in "${numbers[@]}"; do
  if (( num % 2 == 0 )); then
    sum=$((sum + num))
  fi
done

# Output the sum of even numbers
echo $sum
