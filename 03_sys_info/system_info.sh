#!/bin/bash

# 03 - System Information
# 08/19/24
# Create a script that presents a menu to choose from, and repeats until the user quits

# loop
while true
do
  # read 1 char as input with a prompt
  read -n 1 -p "Choose an option from the menu (type 'q' to quit): " input
  echo
  # case statement for input
  case $input in
    "q")
      break
      ;;
    1)
      echo "entered 1: $input"
      ;;
    2)
      echo "entered 2: $input"
      ;;
    3)
      echo "entered 3: $input"
      ;;
    4)
      echo "entered 4: $input"
      ;;
    5)
      echo "entered 5: $input"
      ;;
    6)
      echo "entered 6: $input"
      ;;
    7)
      echo "entered 7: $input"
      ;;
    *)
      echo "input '$input' not recognized"
      ;;
  esac
done

