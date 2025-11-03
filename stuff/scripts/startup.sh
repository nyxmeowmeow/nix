!/usr/bin/env dash

foot nu -e "walker --gapplication-service" &
foot ~/nix/stuff/scripts/hydrate.sh &
foot ~/nix/stuff/scripts/retry.sh &
# foot foot --server &
# foot kitty -1 & #TODO
ghostty --title="ghostty_term" &
ghostty --title="ghostty_nvim" -e nvim &
ghostty --title="ghostty_yazi" -e yazi &
cd ~/shell; nix run .#default
