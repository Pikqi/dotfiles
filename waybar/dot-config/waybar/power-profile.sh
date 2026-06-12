#!/usr/bin/env bash

get_profile() {
    powerprofilesctl get
}

profile_icon() {
    case "$1" in
        performance) echo "" ;;
        balanced)    echo "" ;;
        power-saver) echo "" ;;
        *)           echo "?" ;;
    esac
}

cycle_profile() {
    case "$(get_profile)" in
        performance) powerprofilesctl set balanced ;;
        balanced)    powerprofilesctl set power-saver ;;
        power-saver) powerprofilesctl set performance ;;
    esac
}

if [[ "${1:-}" == "--next" ]]; then
    cycle_profile
    exit 0
fi

profile=$(get_profile)
icon=$(profile_icon "$profile")
jq -nc --arg text "$icon  $profile" --arg class "$profile" '{text: $text, class: $class}'
