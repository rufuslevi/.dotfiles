{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    nix-darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    anyrun.url = "github:anyrun-org/anyrun";
    anyrun.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-stable,
      nixpkgs-unstable,
      nix-darwin,
      home-manager,
      hyprland,
      anyrun,
      ...
    }@attrs:
    let
      inherit (nixpkgs-unstable.lib)
        attrValues
        optionalAttrs
        singleton
        ;
      lib = nixpkgs.lib;

      nixpkgsDarwinConfig = {
        config = {
          allowUnfree = true;
        };
        hostPlatform = "aarch64-darwin";
        overlays =
          attrValues self.overlays
          ++ singleton (
            # Sub in x86 version of packages that don't build on Apple Silicon yet
            final: prev:
            (optionalAttrs (prev.stdenv.system == "aarch64-darwin") {
              inherit (final.pkgs-x86)
                idris2
                nix-index
                niv
                purescript
                ;
            })
          );
      };
    in
    {
      overlays = {
        comma = final: prev: { comma = import { inherit (prev) pkgs; }; };
        apple-silicon =
          final: prev:
          optionalAttrs (prev.stdenv.system == "aarch64-darwin") {
            pkgs-x86 = import nixpkgs {
              system = "x86_64-darwin";
              inherit (nixpkgsDarwinConfig) config;
            };
          };
      };

      darwinConfigurations.luna = nix-darwin.lib.darwinSystem {
        specialArgs = attrs;
        modules = [
          { nixpkgs = nixpkgsDarwinConfig; }
          ./nix/luna
        ];
      };

      nixosConfigurations.domum-light = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = attrs // {
          pkgs-stable = import nixpkgs-stable {
            system = "x86_64-linux";
            config.allowUnfree = true;
          };
        };
        modules = [
          ./nix/nixos/domum
        ];
      };

      nixosConfigurations.domum-dark = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = attrs // {
          pkgs-stable = import nixpkgs-stable {
            system = "x86_64-linux";
            config.allowUnfree = true;
          };
        };
        modules = [
          ./nix/nixos/domum
        ];
      };

      nixosConfigurations.milkyway = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = attrs;
        modules = [
          home-manager.nixosModules.home-manager
          ./nix/nixos/milkyway
        ];
      };
    };
}
