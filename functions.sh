#!/bin/bash

# Pow function: Raises the first argument to the power of the second argument
pow() {
  local base=$1
  local exponent=$2
  echo $((base**exponent))
}



# Shortest string function: Outputs all shortest strings if there are ties
shortest() {
  if [ "$#" -eq 0 ]; then
    echo "No arguments provided."
    return
  fi
  
  local shortest_str="$1"
  local shortest_len=${#shortest_str}
  local result=()

  # Loop through all arguments to find the shortest ones
  for arg in "$@"; do
    if [ ${#arg} -lt $shortest_len ]; then
      shortest_str="$arg"
      shortest_len=${#arg}
      result=("$arg")
    elif [ ${#arg} -eq $shortest_len ]; then
      result+=("$arg")
    fi
  done

  # Output all the shortest strings
  for str in "${result[@]}"; do
    echo "$str"
  done
}
 

# Log function: Prints the string with a timestamp in the format [YYYY-MM-DD HH:MM]
print_log() {
  local log_message="$1"
  local current_time=$(date "+%Y-%m-%d %H:%M")
  echo "[$current_time] $log_message"
}
