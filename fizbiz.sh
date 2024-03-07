#!/usr/bin/bash
for i in {1..100}; do
    if [[ $((i % 5)) -eq 0 ]] && [[ $((i % 3)) -eq 0 ]]; then
        echo fizzbizz
    elif [ $((i % 5)) -eq 0 ]; then
        echo fiz
    elif [ $((i % 3)) -eq 0 ]; then
        echo biz

    else
        echo "$i"

    fi

done
