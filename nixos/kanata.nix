{ config, pkgs, ... }:
{
  services.kanata = {
    enable = true;
    keyboards = {
      internalKeyboard = {
        devices = [
          # Replace the paths below with the appropriate device paths for your setup.
          # Use `ls /dev/input/by-path/` to find your keyboard devices.
          "/dev/input/by-path/platform-i8042-serio-0-event-kbd"
          "/dev/input/by-path/pci-0000:00:14.0-usb-0:3:1.0-event-kbd"
        ];
        extraDefCfg = "process-unmapped-keys yes";
        config = ''
          		(defsrc
          			caps
          			ralt
          			h j k l
          			u d
          		)

          		(defalias
          			;; Caps Lock: Tap for Esc, Hold for LCtrl
          			cap (tap-hold-press 200 200 esc lctl)

          			;; Right Alt: Switches to the "nav" layer while held
          			nav (layer-toggle navigation)
          		)

          		(deflayer base
          			@cap
          			@nav
          			h j k l
          			u d
          		)

          		(deflayer navigation
          			_          ;; Ignore caps in this layer
          			_          ;; Ignore ralt in this layer
          			left down up rght
          			pgup pgdn
          		)

        '';
      };
    };
  };
}
