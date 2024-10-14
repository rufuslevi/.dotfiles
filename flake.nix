{
  inputs = {
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    nix-darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    anyrun = {
      url = "github:anyrun-org/anyrun";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs =
    attrs@{
      nixpkgs-stable,
      nixpkgs-unstable,
      nix-darwin,
      hyprland,
      anyrun,
      ...
    }:
    let
      system_linux = "x86_64-linux";
      system_darwin = "aarch64-darwin";

      attrs.hyprland = hyprland;
      attrs.anyrun = anyrun;

      attrs.pkgs-stable = import nixpkgs-stable {
        inherit system_linux;
        config = {
          allowUnfree = true;
        };
      };

      nixpkgsDarwinConfig = {
        hostPlatform = system_darwin;
        config = {
          allowUnfree = true;
        };
      };
    in
    {
      darwinConfigurations.luna = nix-darwin.lib.darwinSystem {
        specialArgs = attrs;
        modules = [
          { nixpkgs = nixpkgsDarwinConfig; }
          ./nix/luna
        ];
      };

      nixosConfigurations.domum-light = nixpkgs-unstable.lib.nixosSystem {
        system = system_linux;
        specialArgs = attrs;
        modules = [
          ./nix/nixos/domum
        ];
      };

      nixosConfigurations.domum-dark = nixpkgs-unstable.lib.nixosSystem {
        system = system_linux;
        specialArgs = attrs;
        modules = [
          ./nix/nixos/domum
        ];
      };

      nixosConfigurations.milkyway = nixpkgs-unstable.lib.nixosSystem {
        system = system_linux;
        specialArgs = attrs;
        modules = [
          ./nix/nixos/milkyway
        ];
      };
    };
}
