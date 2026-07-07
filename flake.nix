{
  description = "Dotfiles NixOS + Home Manager flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak = {
      url = "github:gmodena/nix-flatpak";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-stable,
      home-manager,
      nix-flatpak,
      ...
    }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";

      stable = import nixpkgs-stable {
        inherit system;
        config.allowUnfree = true;
      };

      mkNixos =
        hostname:
        lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/${hostname}
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                extraSpecialArgs = {
                  inherit stable nix-flatpak;
                };
                users.anon = ./hosts/${hostname}/home.nix;
              };
            }
          ];
        };

      mkHome =
        hostname:
        home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };
          extraSpecialArgs = {
            inherit stable nix-flatpak;
          };
          modules = [ ./hosts/${hostname}/home.nix ];
        };

      hostnames = [
        "gpd"
        "480"
        "pc"
      ];
    in
    {
      nixosConfigurations = lib.genAttrs hostnames mkNixos;
      homeConfigurations = lib.genAttrs hostnames mkHome;
    };
}
