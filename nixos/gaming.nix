{ config, pkgs, ... }:

{

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  services.handheld-daemon = {
    enable = true;
    ui.enable = true;
    user = "anon";
    adjustor = {
      enable = true;
      loadAcpiCallModule = true;
    };
  };

  programs.gamemode.enable = true; # for performance mode

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };

  environment.systemPackages = with pkgs; [
    heroic
    lutris
    protonup-qt
    retroarch-free
  ];

}
