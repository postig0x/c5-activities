#!/bin/bash

# 03 - System Information
# 08/19/24
# Create a script that presents a menu to choose from, and repeats until the user quits

# loop
while true
do
  # display menu
  echo "1. IP Addresses"
  echo "2. Current User"
  echo "3. CPU Information"
  echo "4. Memory Information"
  echo "5. Top 5 Memory Processes"
  echo "6. Top 5 CPU Processes"
  echo "7. Network Connectivity"

  # read 1 char as input with a prompt
  read -n 1 -p "Choose an option from the menu (type 'q' to quit): " input
  echo
  # case statement for input
  case $input in
    "q")
      break
      ;;
    1)
      public_ip=$(curl -s ifconfig.me)
      private_ip=$(ip -4 addr show | grep inet | tail -n 1 | awk '{ print $2 }' | cut -d'/' -f1)
      echo -e "\nIP ADDRESSES"
      echo "PUBLIC IP: $public_ip"
      echo -e "PRIVATE IP: $private_ip\n\n"
      ;;
    2)
      echo -e "\nCURRENT USER"
      echo -e "User is: $(whoami)\n\n"
      ;;
    3)
      echo -e "\nCPU INFORMATION"
      echo -e "The system has $(nproc) CPU\n\n"
      ;;
    4)
      free_mem=$(free | sed -n '2p' | awk '{ print $4 }')
      total_mem=$(free | sed -n '2p' | awk '{ print $2 }')
      echo -e "\nMEMORY INFORMATION"
      echo -e "There is $free_mem Mb unused memory of total $total_mem Mb\n\n"
      ;;
    5)
      echo -e "\nTOP 5 MEMORY PROCESSES"
      echo -e "$(ps aux | sort -k 4 -n -r | head -n 5 | awk '{print $4 "% from command: " $11}')\n\n"
      ;;
    6)
      echo -e "\nTOP 5 CPU PROCESSES"
      echo -e "$(ps aux | sort -k 3 -n -r | head -n 5 | awk '{print "USING " $3 "% CPU:"; for (i=11; i <= NF; i++) printf "%s", $i; printf "\n" }')\n\n"
      ;;
    7)
      echo -e "\nNETWORK PROCESSES"
      read -p "Please provide a website or IP address: " destination
      connection_time=$(curl -o /dev/null -s -w "%{time_total}" $destination)
      echo -e "It took $connection_time seconds to connect to $destination\n\n"
      ;;
    *)
      echo "input '$input' not recognized"
      ;;
  esac
  sleep 1
done

