{ inputs, pkgs, ... }:

{
  imports = [ ../../shared/home/home.nix ./rider.nix ];

  home.packages = import ./packages.nix { inherit pkgs; };
}
