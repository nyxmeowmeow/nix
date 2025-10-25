#!/usr/bin/env dash

clipse -clear &
rm ~/.config/clipse/tmp_files/* &
rm -r ~/.cache/thumbnails/* &
rm /tmp/yazi-1000/* &
rm ~/.local/share/recently-used.xbel &
find ~/.cache/zen -iname "*.png" | xargs rm
find ~/.cache/mozilla/firefox -iname "*.png" | xargs rm
# TODO
