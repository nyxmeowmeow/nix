#!/usr/bin/env bash

title="$1"

mpc --port 6669 search title "$title" | mpc --port 6669 add
position=$(mpc --port 6669 playlist -f '%position% %title%' | grep -i "$title" | head -n1 | cut -d " " -f 1)
mpc --port 6669 play "$position"
