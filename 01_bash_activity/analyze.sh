#!/bin/bash

# this script will analyze /var/log/auth_log.log
# read through each line of the log file
# search for keyword that indicates suspicious login attempts
# if the line contains the keyword, write the line to a new file:
#       suspicious_activity.log
# run the script daily crontab -e

# regex list of words that will help flag suspicious activity
sus_keys="failed|error|unauthorized" # | === "or"

# search for lines containing these words (case-insensitive), and output to desired file (suspicious_activity.log)
grep -i -E "$sus_keys" /var/log/auth_log.log >> suspicious_activity.log
#    -i               -> makes the search case-insensitive
#       -E            -> allows for the use of | (or) in the search arg

