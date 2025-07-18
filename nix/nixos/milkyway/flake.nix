{
  inputs = {
    nixos-stable.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixos-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixos-stable";
    };

    zen-browser.url = "github:MarceColl/zen-browser-flake";
  };

  outputs =
    attrs@{
      nixos-stable,
      nixos-unstable,
      home-manager,
      zen-browser,
      ...
    }:
    let
      system = "x86_64-linux";

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
          ./default.nix
          ../shared
        ];
      };
    };
}
