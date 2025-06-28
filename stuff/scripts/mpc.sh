#!/usr/bin/env dash

title="$1"

mpc -p 6669 search title "$title" | mpc -p 6669 add
position=$(mpc -p 6669 playlist -f '%position% %title%' | grep -i "$title" | head -n1 | cut -d " " -f 1)
mpc -p 6669 play "$position"
