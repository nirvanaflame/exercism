#!/usr/bin/env bash

main () {
    result=$( tr "abcdefghijklmnopqrstuvwxyz" "zyxwvutsrqponmlkjihgfedcba" <<< ${2,,} | tr -d " .," )

    [ "$1" == "encode" ] && result=$(fold -w5 <<< $result)

    echo $result
}

main "$@"