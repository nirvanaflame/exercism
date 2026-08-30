#!/usr/bin/env bash

[[ $# != 1 ]] && { echo "Usage: error_handling.sh <person>" && exit 1; }

echo "Hello, $1"