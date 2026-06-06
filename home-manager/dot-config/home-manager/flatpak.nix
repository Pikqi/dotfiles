{ config, lib, ... }:

let
  nix-flatpak = builtins.fetchTarball {
    url = "https://github.com/gmodena/nix-flatpak/archive/v0.7.0.tar.gz";
    sha256 = "1jsxx20jv2dmf75563i9ldyva99d0qcls2rm424ikx83hnasx47d";
  };
in
{
  imports = [
    "${nix-flatpak}/modules/home-manager.nix"
  ];

  services.flatpak = {
    enable = true;

    packages = [
      # Add your flatpaks here. String shorthand uses flathub origin:
      # "org.mozilla.firefox"
      #
      # Or attribute set to specify origin/commit:
      # { appId = "com.brave.Browser"; origin = "flathub"; }
      "eu.betterbird.Betterbird"
      "io.github.Qalculate"
      "io.github.v81d.Wattage"
    ];

    update = {
      # Update on every activation (default: false)
      onActivation = true;
      auto = {
        enable = true;
        onCalendar = "weekly";
      };
    };
  };
}
