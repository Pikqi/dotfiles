{ pkgs, ... }:
{
  hardware.uinput.enable = true;

  services.kanata = {
    enable = true;
    keyboards = {
      internalKeyboard = {
        devices = [
          "/dev/input/by-path/platform-i8042-serio-0-event-kbd"
          "/dev/input/by-id/usb-_Mouse_for_Windows-if01-event-kbd"
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

  systemd.services.kanata-internalKeyboard = {
    after = [
      "dev-input-by\\x2dpath-platform\\x2di8042\\x2dserio\\x2d0\\x2devent\\x2dkbd.device"
      "dev-input-by\\x2did-usb\\x2d_Mouse_for_Windows\\x2dif01\\x2devent\\x2dkbd.device"
    ];
    wants = [
      "dev-input-by\\x2dpath-platform\\x2di8042\\x2dserio\\x2d0\\x2devent\\x2dkbd.device"
      "dev-input-by\\x2did-usb\\x2d_Mouse_for_Windows\\x2dif01\\x2devent\\x2dkbd.device"
    ];
    serviceConfig.Restart = "on-failure";
    serviceConfig.RestartSec = "2s";
  };
}
