#1/bin/bash

# 04 - Log Script
# 08.14.24
# search for "404" errors in log file, identify IP addresses associated with them
# provide number of times each IP encountered 404

# with no loops
# grep " 404 " web-server-access-logs.log | awk '{ print $1 }' | cut -d'"' -f2 | sort | uniq -c


# with loops

# pad '404' with spaces to isolate the error vs grepping a random number with 404 in it
ip_list=$(grep " 404 " web-server-access-logs.log | awk '{ print $1 }' | cut -d'"' -f2)

# convert list to an array
ip_array=($ip_list)

# create dict to store ip and count
declare -A ip_count

# loop through ip_array and add 1 every time we encounter each IP
for ip in "${ip_array[@]}"
do
  ip_count[$ip]=$(( ip_count[$ip] + 1 ))
  echo {$ip_count[$ip]}
done

# access keys in array with ! in front of associative array name
for ip in "${!ip_count[@]}"
do
  echo "$ip: ${ip_count[$ip]}"
done

