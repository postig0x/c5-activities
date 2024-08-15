#!/bin/bash

#
# Basic Calculator
#

# first integer
echo "Enter the first integer:"
read int1

# NOT (regular expression to make sure $int1 is +/- integer)
if ! [[ $int1 =~ ^-?[0-9]+$ ]]
#                ^ start of string
#                 -? optional negative
#                   [0-9]+ any digit, any number of times
#                         $ end of string
then
  echo "input '$int1' is not an integer"
  exit 1
fi

# second integer
echo "Enter the second integer:"
read int2

# NOT (regular expressions to check if $int2 is an integer)
if ! [[ $int2 =~ ^-?[0-9]+$ ]]
then
  echo "input '$int2' is not an integer"
  exit 1
fi

# prompt for operation
echo "Enter desired operation [+,-,*,/]:"
read operation

# compute the operation and display result
if [[ "$operation" == "+" ]]; then
  echo "RESULT: $(( $int1 + $int2 ))" # addition
elif [[ "$operation" == "-" ]]; then
  echo "RESULT: $(( $int1 - $int2 ))" # subtraction
elif [[ "$operation" == "*" ]]; then
  echo "RESULT: $(( $int1 * $int2 ))" # multiplication
elif [[ "$operation" == "/" ]]; then
  # disallow 0 for second integer, no divide-by-zero
  if [[ $int2 == 0 ]]; then
    echo "Division by zero is not allowed"
    exit 1
  fi
  echo "RESULT: $(( $int1 / $int2 ))" # division
else
  # unsupported operation
  echo "operator $operation not supported"
fi

