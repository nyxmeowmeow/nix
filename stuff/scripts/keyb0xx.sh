#!/usr/bin/env expect


spawn sudo steam-run $HOME/misc/keyb0xx

expect "Enter a number (or 'a' to show all devices):"
send -- "a\r"

sleep 0.1

expect "Multiple devices found... Which device would you like to use?"
send -- "0\r"

expect eof

sleep 99999
