{
  inputs = {
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

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
      hyprland,
      anyrun,
      ...
    }:
    let
      system_linux = "x86_64-linux";

      attrs.hyprland = hyprland;
      attrs.anyrun = anyrun;

      attrs.pkgs-stable = import nixpkgs-stable {
        inherit system_linux;
        config = {
          allowUnfree = true;
        };
      };
    in
    {
      nixosConfigurations.domum = nixpkgs-unstable.lib.nixosSystem {
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
