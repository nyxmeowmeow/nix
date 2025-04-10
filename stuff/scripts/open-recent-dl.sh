#!/bin/bash

DOWNLOADS="$HOME/Downloads"
LATEST_FILE=$(ls -t "$DOWNLOADS" | head -n 1)

if [[ -n "$LATEST_FILE" ]]; then
  foot nvim "$DOWNLOADS/$LATEST_FILE"
else
  notify-send "No files found in Downloads."
fi
