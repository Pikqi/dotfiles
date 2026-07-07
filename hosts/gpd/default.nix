{ config, pkgs, lib, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/common.nix
    ../../modules/nixos/gaming.nix
    ../../modules/nixos/kanata.nix
  ];

  networking.hostName = "gpd";
}
