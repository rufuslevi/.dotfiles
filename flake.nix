{
  inputs = {
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    attrs@{
      nixpkgs-stable,
      nixpkgs-unstable,
      ...
    }:
    let
      system_linux = "x86_64-linux";

      attrs.pkgs-stable = import nixpkgs-stable {
        inherit system_linux;
        config = {
          allowUnfree = true;
        };
      };
    in
    {
      nixosConfigurations.milkyway = nixpkgs-unstable.lib.nixosSystem {
        system = system_linux;
        specialArgs = attrs;
        modules = [
          ./nix/nixos/milkyway
        ];
      };
    };
}
