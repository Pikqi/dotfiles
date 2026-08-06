dir=$(zoxide query -l | sed "s|^$HOME|~|" | fuzzel --dmenu) && dir=$(echo "$dir" | sed "s|^~|$HOME|") && ghostty +new-window --working-directory="$dir"
