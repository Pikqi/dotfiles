host=$(grep "^Host " ~/.ssh/config | awk '{print $2}' | fuzzel --dmenu) && ghostty +new-window -e ssh "$host"
