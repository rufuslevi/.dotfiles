{
  inputs = {
    nixos-stable.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixos-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixos-stable";
    };

    helium = {
      url = "github:mkuritsu/helium-flake";
      inputs.nixpkgs.follows = "nixos-unstable";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixos-unstable";
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixos-unstable";
    };

    agenix.url = "github:ryantm/agenix";

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixos-unstable";
    };
  };

  outputs =
    attrs@{
      agenix,
      nixos-stable,
      nixos-unstable,
      noctalia,
      helium,
      home-manager,
      hyprland,
      stylix,
      zen-browser,
      ...
    }:
    let
      system = "x86_64-linux";

      attrs.agenix = agenix;
      attrs.helium = helium;
      attrs.hyprland = hyprland;
      attrs.zen-browser = zen-browser;
      attrs.noctalia = noctalia;

      attrs.pkgs-stable = import nixos-stable {
        system = system;
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
          noctalia.nixosModules.default
          ./vars.nix
          ./default.nix
          ../shared
        ];
      };
    };
}
