#!/usr/bin/env python3

# 09/03/2024
# File Counter
# Count the number of files and directories in a specified directory (take dir as input)
# Bonus: modify script to count the number of files and directories separately

import os
import sys

# initialize counter variables
files = 0
dirs = 0

# ask for directory path
dir_path = input("What directory do you want to count? ")

# check if path exists
if not os.path.exists(dir_path):
    print(f"{dir_path} does not exist")
    sys.exit(1)

# check if path is a directory
if not os.path.isdir(dir_path):
    print(f"{dir_path} is not a directory")
    sys.exit(1)

for item in os.listdir(dir_path):
    item_path = os.path.join(dir_path, item)
    if os.path.isfile(item_path):
        files += 1
    elif os.path.isdir(item_path):
        dirs += 1


print(f"Directory {dir_path} contains:")
print(f"{files} files")
print(f"{dirs} directories")
