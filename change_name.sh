#!/bin/bash

number=$(ls -1 | grep Tutorial | wc -l)

for (( i = 1; i <= $number; i++ )); do
    if [[ $i -lt 10 ]]; then
        mv Tutorial0$i Chapter0$i
    else
        mv Tutorial$i Chapter$i
    fi
done


