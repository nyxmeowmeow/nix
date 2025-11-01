#!/usr/bin/env nu

let root = (git rev-parse --show-toplevel | str trim)
let rel = (realpath . | path relative-to $root)
$rel | wl-copy
