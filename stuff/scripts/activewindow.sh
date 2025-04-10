#!/bin/bash

# Initialize a variable to track the previous state
previous_state=""

# Initialize a variable to track if Super is currently pressed
super_pressed=false

# Initialize a variable to track if a state change is pending
pending_state_change=false

# Function to monitor Super key state using libinput
monitor_super_key() {
  # Run libinput debug-events and filter for Super_L key events
  libinput debug-events | while read -r line; do
    if echo "$line" | grep -q 'KEY_LEFTMETA (125) pressed'; then
      echo "super_pressed"
    elif echo "$line" | grep -q 'KEY_LEFTMETA (125) released'; then
      echo "super_released"
    fi
  done
}

# Start monitoring the Super key in the background
monitor_super_key | while read -r super_event; do
  if [[ "$super_event" == "super_pressed" ]]; then
    super_pressed=true
    echo "Super key pressed"
  elif [[ "$super_event" == "super_released" ]]; then
    super_pressed=false
    echo "Super key released"
    # If a state change is pending, process it now that Super is released
    if [[ "$pending_state_change" == true ]]; then
      if [[ "$current_state" == "zen" ]]; then
        echo "Changing repeat_delay to 10000"
        hyprctl keyword input:repeat_delay 10000
      else
        echo "Changing repeat_delay to 150"
        hyprctl keyword input:repeat_delay 150
      fi
      # Update the previous state to the current state
      previous_state="$current_state"
      # Reset the pending state change flag
      pending_state_change=false
    fi
  fi
done &

# Store the PID of the background process
super_monitor_pid=$!

# Clean up the background process on script exit
trap "kill $super_monitor_pid" EXIT

# Main loop to monitor Hyprland IPC
socat -U - UNIX-CONNECT:"$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" | while read -r line; do
  # Debug: Print the received line
  echo "Received line: $line"

  # Check if the line contains 'activewindow>>zen,'
  if echo "$line" | grep -q 'activewindow>>zen,'; then
    current_state="zen"
  elif echo "$line" | grep -q 'activewindow>>'; then
    current_state="not_zen"
  else
    # Ignore other signals
    continue
  fi

  # Debug: Print the current and previous states
  echo "Current state: $current_state"
  echo "Previous state: $previous_state"
  echo "Super key pressed: $super_pressed"

  # Only send the command if the state has changed
  if [[ "$current_state" != "$previous_state" ]]; then
    if [[ "$super_pressed" == true ]]; then
      # If Super is pressed, mark the state change as pending
      pending_state_change=true
      echo "State change deferred (Super key is pressed)"
    else
      # If Super is not pressed, process the state change immediately
      if [[ "$current_state" == "zen" ]]; then
        echo "Changing repeat_delay to 10000"
        hyprctl keyword input:repeat_delay 10000
      else
        echo "Changing repeat_delay to 150"
        hyprctl keyword input:repeat_delay 150
      fi
      # Update the previous state to the current state
      previous_state="$current_state"
    fi
  fi

  # Debug: Separator for readability
  echo "-----------------------------"
done
