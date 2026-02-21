{
  inputs = {
    nixos-stable.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixos-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixos-stable";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixos-stable";
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

    zed.url = "github:zed-industries/zed";
  };

  outputs =
    attrs@{
      agenix,
      nixos-stable,
      nixos-unstable,
      noctalia,
      nur,
      helium,
      home-manager,
      hyprland,
      stylix,
      zen-browser,
      zed,
      ...
    }:
    let
      system = "x86_64-linux";

      attrs.agenix = agenix;
      attrs.helium = helium;
      attrs.hyprland = hyprland;
      attrs.zen-browser = zen-browser;
      attrs.noctalia = noctalia;
      attrs.nur = nur;
      attrs.zed = zed;

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
          nur.modules.nixos.default
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
