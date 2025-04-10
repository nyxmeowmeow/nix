if [[ $(hyprctl activewindow -j | jq -r ".class") == "Steam" ]]; then
  xdotool windowunmap $(xdotool getactivewindow)
elif
  [[ $(hyprctl activewindow -j | jq -r ".class") == "steam_app_322170" ]]
then
  hyprctl activewindow
elif
  [[ $(hyprctl activewindow -j | jq -r ".class") == "dotnet" ]]
then
  hyprctl activewindow
elif
  [[ $(hyprctl activewindow -j | jq -r ".class") == "steam_app_2379780" ]]
then
  hyprctl activewindow
else
  hyprctl dispatch killactive ""
fi
