session=$(tmux list-sessions -F '#{session_name}' 2>/dev/null | fuzzel --dmenu) && ghostty -e tmux attach -t "$session"
