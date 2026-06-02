
{ config, pkgs, ... }:

{

	services.handheld-daemon = {
		enable = true;
		ui.enable = true;
		user = "anon";
		adjustor = {
		  enable = true;
			loadAcpiCallModule = true;
		};
  };

}
