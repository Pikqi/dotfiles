#!/bin/sh
set -e

selection=$(cliphist list | fuzzel --dmenu)
[ -z "$selection" ] && exit 0

echo "$selection" | cliphist decode | wl-copy
wtype -M ctrl v -m ctrl