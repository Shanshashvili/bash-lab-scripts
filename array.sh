#!/bin/bash

# Check if argument is passed
if [ -z "$1" ]; then
  echo "Please provide the number of folders to create."
  exit 1
fi

# Get the count of folders to be created
folder_count=$1

# Check if the input is a valid number and between 1 and 26
if ! [[ "$folder_count" =~ ^[0-9]+$ ]] || [ "$folder_count" -lt 1 ] || [ "$folder_count" -gt 26 ]; then
  echo "Please enter a valid number between 1 and 26."
  exit 1
fi

# Create folders and store their names in an array
declare -a folder_names=()
for ((i=0; i<folder_count; i++)); do
  folder_name="folder_$(printf \\$(printf '%03o' $((97 + i))))"
  mkdir -p "$folder_name"
  folder_names+=("$folder_name")
done

# Output results in one line with commas separating folder names
if [ "$folder_count" -eq 1 ]; then
  echo -n "$folder_count folder created: "
else
  echo -n "$folder_count folders created: "
fi
echo "${folder_names[*]}" | sed 's/ /, /g'
