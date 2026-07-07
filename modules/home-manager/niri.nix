{
  config,
  pkgs,
  lib,
  ...
}:

let

  lock_timeout = 300;
  screen_off_timeout = 600;
  suspend_timeout = 1200;

in
{
  options.niri.overrides = lib.mkOption {
    type = lib.types.str;
    default = "";
    description = ''
      Contents of `~/.config/niri/override.kdl`, included at the end of the
      main `config.kdl`. Write a raw KDL string.
    '';
    example = ''
      output "eDP-1" {
          scale 1.5
      }
    '';
  };

  config = {
    xdg.configFile."niri/override.kdl".text = config.niri.overrides;

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

    programs.fuzzel = {
      enable = true;
      settings = {
        main = {
          font = "Hack Nerd Font:size=14";
          icon-theme = "Papirus-Dark";
          lines = 20;
          width = 50;
          prompt = "\"❯ \"";
          line-height = 24;
          padding = 8;
        };
        colors = {
          background = "1d2021ff";
          foreground = "ebdbb2ff";
          match = "fe8019ff";
          selection-background = "504945ee";
          selection-foreground = "fbf1c7ff";
          selection-match = "fe8019ff";
          border = "d79921ff";
        };
        border = {
          width = 2;
          radius = 8;
        };
      };
    };

    home.packages = with pkgs; [
      niri
      waybar
      swaynotificationcenter
    ];

    home.file = {
      "${config.home.homeDirectory}/.config/swaylock/lockscreen.png".source = ../../lockscreen.png;
    };
  };
}
