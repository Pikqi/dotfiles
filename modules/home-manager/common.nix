{
  config,
  pkgs,
  stable,
  ...
}:
{
  imports = [
    ./syncthing.nix
    ./niri.nix
    ./develop.nix
    ./mime.nix
    ./flatpak.nix
    ./gaming.nix
  ];

  programs.git = {
    enable = true;
    lfs.enable = true;
    settings.user = {
      name = "Petar Obradovic";
      email = "perazmn@gmail.com";
    };
    includes = [
      {
        condition = "gitdir:~/dmz/";
        path = "~/.gitconfig-decentrala";
      }
    ];
  };

  programs.starship.enable = true;
  programs.zoxide.enable = true;
  programs.lazygit.enable = true;
  programs.fuzzel.enable = true;
  programs.fzf.enable = true;

  services.cliphist.enable = true;

  programs.btop = {
    enable = true;
    settings = {
      vim_keys = true;
    };
  };

  home.stateVersion = "25.11";

  home.packages =
    with pkgs;
    [
      # web
      ungoogled-chromium
      dino
      ferdium

      # Dev tools
      rustup
      go
      lua
      python3
      ripgrep
      fd
      opencode
      stow
      neovim
      alacritty

      # System utilities
      wl-clipboard
      wtype
      bluetuith
      fastfetch
      sshfs
      unzip
      zip
      p7zip
      unrar
      jq
      file

      # Files & productivity
      ranger
      man
      dust
      keepassxc
      thunar
      awww
      prettierd
      libreoffice

      # Media
      zathura
      imv
      mpv
      pavucontrol
      crosspipe
      feishin

      kdePackages.dolphin

      qgroundcontrol
      nodejs
    ]
    ++ [
      stable.librewolf
      kdePackages.qtsvg
      kdePackages.kio
      kdePackages.kio-fuse
      kdePackages.kio-extras
    ];

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk4.theme = config.gtk.theme;
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk3";
    style = {
      name = "breeze";
      package = pkgs.kdePackages.breeze;
    };
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.home-manager.enable = true;
}
