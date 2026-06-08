{ config, lib, ... }:

{
  services.flatpak = {
    enable = true;

    packages = [
      "org.pegasus_frontend.Pegasus"
    ];
  };
}
