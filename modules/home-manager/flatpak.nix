{ config, lib, nix-flatpak, ... }:

{
  imports = [
    "${nix-flatpak}/modules/home-manager.nix"
  ];

  services.flatpak = {
    enable = true;

    packages = [
      "eu.betterbird.Betterbird"
      "io.github.Qalculate"
      "io.github.v81d.Wattage"
      "com.logseq.Logseq"
    ];

    update = {
      onActivation = true;
      auto = {
        enable = true;
        onCalendar = "weekly";
      };
    };
  };
}
