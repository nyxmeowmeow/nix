!/usr/bin/env dash

foot nu -e "walker --gapplication-service" &
foot ~/nix/stuff/scripts/hydrate.sh &
foot ~/nix/stuff/scripts/retry.sh &
foot foot --server &
cd ~/shell; nix run .#default
