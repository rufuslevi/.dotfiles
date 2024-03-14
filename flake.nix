{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-23.11-darwin";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
    };
    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };

    anyrun = {
      url = "github:Kirottu/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, darwin, nixpkgs, nixpkgs-darwin, home-manager, ... }@inputs:
    let
      user = "rufuslevi";
      hostname = "luna";
      system = "aarch64-darwin";
      specialArgs = { inherit user hostname; };

      inherit (darwin.lib) darwinSystem;
      inherit (inputs.nixpkgs-unstable.lib) attrValues makeOverridable optionalAttrs singleton;

      nixpkgsDarwinConfig = {
        config = { allowUnfree = true; };
        overlays = attrValues self.overlays ++ singleton (
          # Sub in x86 version of packages that don't build on Apple Silicon yet
          final: prev: (optionalAttrs (prev.stdenv.system == "aarch64-darwin") {
            inherit (final.pkgs-x86)
              idris2
              nix-index
              niv
              purescript;
          })
        );
      };
    in
    {
      overlays = {
        comma = final: prev: {
          comma = import inputs.comma { inherit (prev) pkgs; };
        };
        apple-silicon = final: prev: optionalAttrs (prev.stdenv.system == "aarch64-darwin") {
          pkgs-x86 = import inputs.nixpkgs-darwin {
            system = "x86_64-darwin";
            inherit (nixpkgsDarwinConfig) config;
          };
        };
      };

      darwinConfigurations = rec {
        luna = darwinSystem {
          inherit system specialArgs;
          modules = [
            ./darwin/configuration.nix
            home-manager.darwinModules.home-manager
            {
              nixpkgs = nixpkgsDarwinConfig;
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.rufuslevi = import ./darwin/home.nix;
            }
          ];
        };
      };

      nixosConfigurations.domum = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./nixos/hardware-configuration.nix
          ./nixos/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              extraSpecialArgs = { inherit inputs; };
              useGlobalPkgs = true;
              useUserPackages = true;
              users.rufuslevi = import ./nixos/home/configuration.nix;
            };
          }
        ];
      };
    };
}
