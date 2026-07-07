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

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      nvimConfig = pkgs.stdenvNoCC.mkDerivation {
        name = "nvim-config";
        src = ./nvim/dot-config/nvim;
        dontBuild = true;
        installPhase = ''
          mkdir -p $out
          cp -r . $out/
          chmod -R u+w $out
        '';
      };

      nvimPackage = pkgs.writeShellApplication {
        name = "nvim";
        runtimeInputs = with pkgs; [
          neovim
          git
          ripgrep
          fd
          gnumake
          gcc
          unzip
        ];
        text = ''
          tmpdir_root=/tmp/nix-nvim-$USER
          mkdir -p "$tmpdir_root"
          export XDG_CONFIG_HOME="$tmpdir_root/config"
          export XDG_DATA_HOME="$tmpdir_root/data"
          export XDG_STATE_HOME="$tmpdir_root/state"
          export XDG_CACHE_HOME="$tmpdir_root/cache"
          mkdir -p "$XDG_CONFIG_HOME/nvim"
          cp -r ${nvimConfig}/. "$XDG_CONFIG_HOME/nvim/"
          chmod -R u+w "$XDG_CONFIG_HOME/nvim"
          exec nvim "$@"
        '';
      };
    in
    {
      packages.x86_64-linux.nvim = nvimPackage;
      nixosConfigurations = lib.genAttrs hostnames mkNixos;
      homeConfigurations = lib.genAttrs hostnames mkHome;
    };
}
