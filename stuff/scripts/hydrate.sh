#!/usr/bin/env bash
echo "first reminder at $(date -d '1200 seconds' +'%H:%H:%S' )"

while true; do
    sleep 1200
    notify-send -t 1500 "dirnk water"
    echo "next reminder at $(date -d '1200 seconds' +'%H:%H:%S' )"
done
