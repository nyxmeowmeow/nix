#!/usr/bin/env dash

clipse -clear &
wl-copy --clear &
rm ~/.config/clipse/tmp_files/* &
rm -r ~/.cache/thumbnails/* &
rm /tmp/yazi-1000/* &
rm ~/.local/share/recently-used.xbel &
find ~/.cache/zen -iname "*.png" | xargs rm
find ~/.cache/mozilla/firefox  -iname "*.png" | xargs rm

# remove stuff from shell history
grep -v "rm " ~/.config/nushell/history.txt > /tmp/nushell_history
cat /tmp/nushell_history > ~/.config/nushell/history.txt
grep -v " rm" ~/.config/nushell/history.txt > /tmp/nushell_history
cat /tmp/nushell_history > ~/.config/nushell/history.txt
grep -v "reboot" ~/.config/nushell/history.txt > /tmp/nushell_history
cat /tmp/nushell_history > ~/.config/nushell/history.txt
grep -v "shutdown" ~/.config/nushell/history.txt > /tmp/nushell_history
cat /tmp/nushell_history > ~/.config/nushell/history.txt
rm -f /tmp/nushell_history
# TODO
