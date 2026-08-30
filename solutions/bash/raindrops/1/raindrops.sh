#!/usr/bin/env bash

n=$1
ans=""

if [ $((n % 3)) == 0 ]; then
  ans+="Pling"
fi

if [ $((n % 5)) == 0 ]; then
  ans+="Plang"
fi

if [ $((n % 7)) == 0 ]; then
  ans+="Plong"
fi

echo "${ans:-$n}"
