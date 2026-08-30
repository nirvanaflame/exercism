#!/usr/bin/env bash

t=$1
text=${t^^}

acronym=""
for word in ${text//[-_\*]/ }; do
  acronym+=${word::1}
done

echo "$acronym"

