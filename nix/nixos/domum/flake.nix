{
  inputs = {
    nixos-stable.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixos-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixos-stable";
    };

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    stylix.url = "github:danth/stylix";

    anyrun = {
      url = "github:anyrun-org/anyrun";
      inputs.nixpkgs.follows = "nixos-stable";
    };
  };

  outputs =
    attrs@{
      nixos-stable,
      nixos-unstable,
      home-manager,
      hyprland,
      stylix,
      anyrun,
      ...
    }:
    let
      system = "x86_64-linux";

      attrs.hyprland = hyprland;
      attrs.anyrun = anyrun;

      attrs.pkgs-stable = import nixos-stable {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
    in
    {
      nixosConfigurations.domum = nixos-unstable.lib.nixosSystem {
        system = system;
        specialArgs = attrs;
        modules = [
          home-manager.nixosModules.home-manager
          stylix.nixosModules.stylix
          ./default.nix
          ../shared
        ];
      };
    };
}
