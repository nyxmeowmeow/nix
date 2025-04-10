if [[ $(hyprctl activeworkspace -j | jq -r ".monitor") == "DP-3" ]]; then
    hyprctl dispatch focusmonitor DP-1
else
    hyprctl dispatch focusmonitor DP-3
fi
