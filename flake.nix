{
  inputs = {
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    attrs@{
      nixpkgs-stable,
      nixpkgs-unstable,
      ...
    }:
    let
      system = "x86_64-linux";

      attrs.pkgs-stable = import nixpkgs-stable {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
    in
    {
      nixosConfigurations.milkyway = nixpkgs-unstable.lib.nixosSystem {
        system = system;
        specialArgs = attrs;
        modules = [
          ./nix/nixos/milkyway
        ];
      };
    };
}
