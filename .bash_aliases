# custom alias list
tl(){
  tree -L "$1"
}

# mkdir and cd into it
mkcd(){
  mkdir "$1" && cd "$1"
}
alias lla='ls -lA'

alias gs='git status'
alias gl='git log'

alias aptup='sudo apt update && sudo apt upgrade'

alias vimcheat='xdg-open https://vim.rtorr.com/'
alias vim='nvim'
alias nv="nvim ."

alias ta="tmux a || tmux"
# alias tn="tmux new"
alias tls="tmux ls"

alias tc="tmuxifier load-session client"
alias tl="tmuxifier load-session launchpad-client"

alias sshpi="ssh petar@192.168.23.12"

alias lg="lazygit"
alias lazyconfig="lazygit -w $HOME --git-dir $HOME/.local/share/yadm/repo.git"

# Alias for dotfiles git repo
# alias config='/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME' 
# alias lazyconfig='lazygit --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME' 

alias r="ranger"
alias cl="clear"
alias bl="bluetuith"

# LS 
alias l="exa -l"
alias la="exa -la"

# Opens a file in neovim using fzf search, only if fzf returns any value
fv() {
  local selected_file
  selected_file="$(fzf)"
  if [ -n "$selected_file" ]; then
    nvim "$selected_file"
  fi
}

fc() {
  local selected_file
  selected_file="$(fzf)"
  if [ -n "$selected_file" ]; then
		code "$selected_file"
  fi
}

tn (){
	session_name=$(basename "$PWD")
	tmux new-session -s "$session_name"
}
