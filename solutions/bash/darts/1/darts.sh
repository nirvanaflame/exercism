#!/bin/bash

float='^[+-]?[0-9]*\.?[0-9]*$'

if [[ $# -ne 2 ]] || [[ ! "$1" =~ $float ]] || [[ ! "$2" =~ $float ]]
then
    echo 'Usage: ./darts.sh <x> <y>'
    exit 1
else
    distance=$(echo "sqrt($1^2 + $2^2)" | bc -l)

    if (( $(echo "$distance <= 1" | bc) ))
    then
        echo '10'
    elif (( $(echo "$distance <= 5" | bc) ))
    then
        echo '5'
    elif (( $(echo "$distance <= 10" | bc) ))
    then
        echo '1'
    else
        echo '0'
    fi
fi