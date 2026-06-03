{ config, pkgs, ... }:

let

  lock_timeout = 300;
  screen_off_timeout = 600;
  suspend_timeout = 1200;

in
{
  programs.swaylock = {
    enable = true;
    settings = {
      show-failed-attempts = true;
      indicator-radius = 75;
      indicator-thickness = 15;
      image = "${config.home.homeDirectory}/.config/swaylock/lockscreen.png";
      scaling = "fill";
    };
  };

  services.swayidle = {
    enable = true;
    timeouts = [
      {
        timeout = lock_timeout;
        command = "${pkgs.swaylock}/bin/swaylock -f";
      }
      {
        timeout = screen_off_timeout;
        command = "${pkgs.niri}/bin/niri msg action power-off-monitors";
      }
      {
        timeout = suspend_timeout;
        command = "${pkgs.systemd}/bin/systemctl suspend";
      }
    ];
    events = {
      "before-sleep" = "${pkgs.swaylock}/bin/swaylock -f";
    };
  };

  home.packages = with pkgs; [
    waybar
    swaynotificationcenter
  ];

  home.file = {
    "/home/anon/.config/swaylock/lockscreen.png".source = /home/anon/dotfiles/lockscreen.png;
  };
}