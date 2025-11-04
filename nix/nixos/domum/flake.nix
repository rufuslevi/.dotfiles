{
  inputs = {
    nixos-stable.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixos-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixos-stable";
    };

    hyprland.url = "git+https://github.com/hyprwm/Hyprland";

    stylix.url = "github:danth/stylix/release-24.11";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixos-stable";
    };

    agenix.url = "github:ryantm/agenix";
  };

  outputs =
    attrs@{
      agenix,
      nixos-stable,
      nixos-unstable,
      home-manager,
      hyprland,
      stylix,
      zen-browser,
      ...
    }:
    let
      system = "x86_64-linux";

      attrs.agenix = agenix;
      attrs.hyprland = hyprland;
      attrs.zen-browser = zen-browser;

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
          agenix.nixosModules.default
          ./default.nix
          ../shared
        ];
      };
    };
}
