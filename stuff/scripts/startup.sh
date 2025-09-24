!/usr/bin/env dash

foot nu -e "walker --gapplication-service" &
foot ~/nix/stuff/scripts/hydrate.sh &
foot ~/.config/kanata/hyprkan -d
