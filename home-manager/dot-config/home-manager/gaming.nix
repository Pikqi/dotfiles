{ config, pkgs, ... }:

{

  home.packages = with pkgs; [
    heroic
    lutris
    protonup-qt
    retroarch-free
  ];

  programs.mangohud = {
    enable = true;
    enableSessionWide = true;
    settings = {
      preset = 2;
    };

  };

  services.flatpak = {
    enable = true;

    packages = [
      "org.pegasus_frontend.Pegasus"
    ];
  };
}
