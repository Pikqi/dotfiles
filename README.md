
##### How to clone this config
Recommended way of using this config is by cloning it to the home folder as an bare repo.
`git clone https://github.com/Pikqi/.dotfiles --bare`
After that create an alias for that git dir with this command. 
`alias config='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME' 
`
That lets us use the repo with the command  `config`
To get the files just type
`config checkout`

#### Some of the apps i use on the daily regardless of the system
- Neovim - Prefered text editor
- Tmux - terminal multiplexer when working with more TUI apps and more codebases in the same time.
- Obsidian markdown note taking app
- Ranger TUI file explorer, vim based
- Lazygit - TUI git solution
- bash - shell
- fnm - fast node manager
- zoxide - for jumping between directories

#### Apps that are specific to a system (GNU/Linux)
- i3wm - A tiling window manager
- btop - resource manager
- Alacritty - hardware accelerated terminal emulator
- dunst - notification server
- rofi - application launcher
- AppImageLauncher - manger for appimages
- betterlockscreen - Lockscreen utility I use with i3
- autorandr - xrandr manager with support for multiple profiles and auto switching
- Ksnip - screenshotting utility
- Bluetuith - TUI bluetooth manager
