#!/usr/bin/env bash
set -e
IFS=$'\t'

export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"

if command -v parallel >/dev/null 2>&1; then
	parallel '
	magick {} -quality ${quality} $([ "$lossless" = true ] && echo "-define	png:lossless=true") {.}.png &&
	touch -r {} {.}.png
	' ::: $selection
else
	for file in ${selection}; do
		magick "$file" -quality ${quality} $([ "$lossless" = true ] && echo $'-define\tpng:lossless=true') "${file%.*}.png"
		touch -r "$file" "${file%.*}.png"
	done
fi
