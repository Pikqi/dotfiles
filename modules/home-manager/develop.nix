{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    jetbrains.idea-oss
    docker-compose
    perf
  ];
}
