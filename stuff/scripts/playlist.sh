#!/usr/bin/env dash

current=$(mpc --port 6669 --format %title% current)
mpc --port 6669 --format %title% playlist | while read -r line; do
    if [[ "$line" == "$current" ]]; then
        echo "> $line"
    else
        echo "  $line"
    fi
done
