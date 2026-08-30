#!/usr/bin/env bash

first=$1
second=$2
fl=${#first}
sl=${#second}

[[ "$#" != 2 ]] && { echo "Usage: hamming.sh <string1> <string2>"; exit 1; }
[[ "$fl" != "$sl" ]] && { echo "strands must be of equal length"; exit 1; }

count=0
for ((i = 0; i < fl; i++)); do
  [[ ${first:$i:1} != "${second:$i:1}" ]] && ((count += 1))
done

echo "$count"
