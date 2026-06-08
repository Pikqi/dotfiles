#!/usr/bin/env bash
STEP=1
MIN_TDP=4
MID_TDP=15
MAX_TDP=28

CURRENT=$(hhdctl get | grep '^tdp\.qam\.tdp=' | cut -d= -f2)
[ -z "$CURRENT" ] && { notify-send -u critical "TDP" "Could not read current TDP"; exit 1; }

case "${1:-}" in
    up)   NEW=$((CURRENT + STEP)); [ "$NEW" -gt "$MAX_TDP" ] && NEW=$MAX_TDP ;;
    down) NEW=$((CURRENT - STEP)); [ "$NEW" -lt "$MIN_TDP" ] && NEW=$MIN_TDP ;;
    toggle)
        if   [ "$CURRENT" -le "$(( (MIN_TDP + MID_TDP) / 2 ))" ]; then NEW=$MID_TDP
        elif [ "$CURRENT" -le "$(( (MID_TDP + MAX_TDP) / 2 ))" ]; then NEW=$MAX_TDP
        else NEW=$MIN_TDP
        fi
        ;;
    *)    echo "Usage: $0 {up|down|toggle}"; exit 1 ;;
esac

hhdctl set "tdp.qam.tdp=$NEW"

PROGRESS=$(awk "BEGIN { printf \"%.2f\", $NEW / $MAX_TDP }")
swayosd-client --custom-progress "$PROGRESS" --custom-progress-text "TDP ${NEW}W" || \
    notify-send -h int:value:"$(( NEW * 100 / MAX_TDP ))" "TDP" "${NEW}W"
