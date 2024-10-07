#!/bin/bash

# Check if an argument is provided
if [ -z "$1" ]; then
  echo "Please provide a temperature value (e.g., 55C or 122K)"
  exit 1
fi

# Extract the number and the unit from the argument
temp_value="${1%[CKck]}"  # Remove the last character (C or K)
unit="${1: -1}"           # Get the last character (C or K)

# Check if the value is numeric
if ! [[ "$temp_value" =~ ^-?[0-9]+$ ]]; then
  echo "Invalid temperature value. Please provide a numeric value followed by 'C' or 'K'."
  exit 1
fi

# Convert based on the unit
if [[ "$unit" == "C" || "$unit" == "c" ]]; then
  # Convert Celsius to Kelvin
  kelvin=$((temp_value + 273))
  echo "${kelvin}K"
elif [[ "$unit" == "K" || "$unit" == "k" ]]; then
  # Convert Kelvin to Celsius
  celsius=$((temp_value - 273))
  echo "${celsius}C"
else
  echo "Invalid unit. Please use 'C' for Celsius or 'K' for Kelvin."
  exit 1
fi
