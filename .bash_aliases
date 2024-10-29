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
# alias vim='nvim'
alias nv="nvim ."

alias ta="tmux a || tmux"
# alias tn="tmux new"
alias tls="tmux ls"

alias tc="tmuxifier load-session client"
alias tl="tmuxifier load-session launchpad-client"

alias ssh!="ssh home"

alias lg="lazygit"
# alias lazyconfig="lazygit -w $HOME --git-dir $HOME/.local/share/yadm/repo.git"

# Alias for dotfiles git repo
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME' 
alias lazyconfig='lazygit --git-dir=$HOME/.dotfiles/ --work-tree=$HOME' 

alias r="ranger"
alias cl="clear"
alias bl="bluetuith"

alias todo="glow $HOME/docs/OPVault/400\ Hobi/todoLinux.md"

# LS 
alias l="exa -l"
alias la="exa -la"

alias p="pnpm"
alias gcci="git commit --allow-empty -m \"trigger ci/cd\""

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

manv (){
	man $1 | nvim
}


alias bt="bluetuith"

alias nn="NVIM_APPNAME=novi-nvim nvim"
alias godot="~/games/Godot_v4.3-stable_linux.x86_64"
