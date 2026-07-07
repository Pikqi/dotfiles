{ config, pkgs, ... }:

let
  stable =
    import (builtins.fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-26.05.tar.gz")
      {
        config = {
          allowUnfree = true;
        };
      };
in

{
  imports = [
    ./syncthing.nix
    ./niri.nix
    ./develop.nix
    ./mime.nix
    ./flatpak.nix
    ./gaming.nix
  ];

  nixpkgs.config.allowUnfree = true;

  home.username = "anon";
  home.homeDirectory = "/home/anon";

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

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.11"; # Please read the comment before changing.

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

      # Stable-pinned
    ]
    ++ [
      stable.librewolf
      kdePackages.qtsvg
      kdePackages.kio
      kdePackages.kio-fuse # to mount remote filesystems via FUSE
      kdePackages.kio-extras # extra protocols support (sftp, fish and more)
    ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/anon/etc/profile.d/hm-session-vars.sh
  #
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

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
