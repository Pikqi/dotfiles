{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    jetbrains.idea-oss
    podman
    podman-compose
  ];
}
