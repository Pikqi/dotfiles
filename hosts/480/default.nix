{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/common.nix
    ../../modules/nixos/kanata.nix
  ];

  networking.hostName = "480";

  # No ESP on this disk (lsblk -f shows no vfat partition);
  # NixOS does not install a bootloader here. Boot is managed
  # out-of-band (e.g. existing firmware entry / external loader).
  boot.loader.grub.enable = false;
  boot.loader.systemd-boot.enable = false;
}
