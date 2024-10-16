{
  inputs = {
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    nix-darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs =
    attrs@{
      nixpkgs-stable,
      nix-darwin,
      ...
    }:
    let
      system = "aarch64-darwin";

      attrs.pkgs-stable = import nixpkgs-stable {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };

      nixpkgsDarwinConfig = {
        hostPlatform = system;
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
          ./default.nix
        ];
      };
    };
}
