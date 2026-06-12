{ config, pkgs, ... }:

{
  services.syncthing = {
    enable = true;
    settings = {
      gui = {
        # user = "anon";
        # password = "";  # consider using sops/agenix
      };

      folders = {
        "sync" = {
          path = "~/sync";
          devices = [
            "480"
            "server"
            "pixel"
            "pc"
          ];
          id = "4w5mn-got2k";
        };
        "pass" = {
          path = "~/pass";
          devices = [
            "480"
            "server"
            "pixel"
            "pc"
          ];
          id = "gtzen-gtkc4";
        };
        "OPVault" = {
          path = "~/Documents/OPVault";
          devices = [
            "480"
            "server"
            "pixel"
            "pc"
          ];
          id = "cqhrv-7kezv";
        };
      };

      devices = {
        "480" = {
          id = "LJBEHDK-DQ4DWYM-DCM633H-MALOOVK-C7R7MQL-DUHR4L2-6SEUMJL-HK4HZA4";
        };
        "server" = {
          id = "U6YAGGG-GU74BMW-JPK5WRF-DGCDK6R-PYNQQK7-T3T5DYL-NKP43YP-CMNXVAQ";
        };
        "pixel" = {
          id = "J5GA4Z6-TU6WFHK-EPHZZHJ-GXNE2IW-ZFNHKCF-36IQYHC-IM3U4HJ-7CB3MAT";
        };
        "pc" = {
          id = "YOL6CZE-CO6AKAI-4HH3TXG-XHORN3Y-UF637II-NTDK47B-S36EHJW-OQADTAM";
        };

      };
    };
  };
}
