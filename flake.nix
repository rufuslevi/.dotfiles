{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    nix-darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    anyrun.url = "github:anyrun-org/anyrun";
    anyrun.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      hyprland,
      nixpkgs-unstable,
      nix-darwin,
      home-manager,
      anyrun,
      ...
    }@attrs:
    let
      inherit (nixpkgs-unstable.lib)
        attrValues
        optionalAttrs
        singleton
        ;

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
          home-manager.darwinModules.home-manager
          ./nix/luna
        ];
      };

      nixosConfigurations.domum-light = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = attrs;
        modules = [
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              extraSpecialArgs = attrs;
              useGlobalPkgs = true;
              useUserPackages = true;
              users.rufuslevi = {
                imports = [
                  anyrun.homeManagerModules.anyrun
                  ./nix/nixos/domum/home
                  ./nix/nixos/shared/home/themes/light_theme.nix
                ];
              };
            };
          }
          ./nix/nixos/domum
        ];
      };

      nixosConfigurations.domum-dark = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = attrs;
        modules = [
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "hm-backup";
              extraSpecialArgs = attrs;
              users.rufuslevi = {
                imports = [
                  anyrun.homeManagerModules.anyrun
                  ./nix/nixos/domum/home
                  ./nix/nixos/shared/home/themes/dark_theme.nix
                ];
              };
            };
          }
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
