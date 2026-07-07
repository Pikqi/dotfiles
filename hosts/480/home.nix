{ lib, ... }:

{
  imports = [
    ../../modules/home-manager/common.nix
  ];

  home.username = lib.mkDefault "anon";
  home.homeDirectory = lib.mkDefault "/home/anon";
}
