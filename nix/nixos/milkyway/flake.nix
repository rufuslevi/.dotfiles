{
  inputs = {
    nixos-stable.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixos-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixos-stable";
    };

    zen-browser.url = "github:MarceColl/zen-browser-flake";

    agenix.url = "github:ryantm/agenix";
  };

  outputs =
    attrs@{
      agenix,
      nixos-stable,
      nixos-unstable,
      home-manager,
      zen-browser,
      ...
    }:
    let
      system = "x86_64-linux";

      attrs.agenix = agenix;
      attrs.zen-browser = zen-browser;

      attrs.pkgs-stable = import nixos-stable {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
    in
    {
      nixosConfigurations.milkyway = nixos-unstable.lib.nixosSystem {
        system = system;
        specialArgs = attrs;
        modules = [
          home-manager.nixosModules.home-manager
          agenix.nixosModules.default
          ./default.nix
          ../shared
        ];
      };
    };
}
