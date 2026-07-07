{ config, pkgs, lib, ... }:

let
  user = "anon";
in
{
  # Bootloader.
  #  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.enable = true;
  boot.loader.grub.devices = [ "nodev" ];
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.useOSProber = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Enable networking
  networking.networkmanager.enable = true;

  security.polkit.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Belgrade";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  services.desktopManager.gnome.enable = true;
  services.displayManager.ly = {
    enable = true;
    settings = {
      animation = "colormix";
    };
  };
  services.displayManager.defaultSession = "niri";

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    tmux
    gcc
    home-manager
    brightnessctl
    ddcutil
    swayosd
    swaylock
    xwayland-satellite
    tldr
    gnumake
    appimage-run
    libnotify
  ];

  fonts.packages = with pkgs; [ nerd-fonts.hack ];

  users.users.${user} = {
    isNormalUser = true;
    description = "anon";
    extraGroups = [
      "networkmanager"
      "wheel"
      "input"
      "docker"
      "dialout"
    ];
  };

  virtualisation.docker.enable = true;

  programs.niri.enable = true;
  programs.xwayland.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];
  };

  services.flatpak.enable = true;

  services.tailscale = {
    enable = true;
    useRoutingFeatures = "client";
    extraUpFlags = [ "--accept-routes" ];
  };

  services.openssh = {
    enable = true;
    openFirewall = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
      AllowUsers = [ "anon" ];
      MaxAuthTries = 3;
      PerSourcePenalties = "crash:3600s authfail:3600s max:86400s";
    };
  };

  system.stateVersion = "26.05";

  services.logind.settings.Login.HandleLidSwitch = "suspend";
}
