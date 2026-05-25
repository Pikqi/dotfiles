SESSION_NAME="music"

tmux attach -t "$SESSION_NAME" 2>/dev/null

if [ $? -ne 0 ]; then

  tmux new-session -d -s "$SESSION_NAME" -c ~

  tmux send-keys -t "$SESSION_NAME" 'subtui' C-m

  tmux attach -t "$SESSION_NAME" 2>/dev/null
fi
