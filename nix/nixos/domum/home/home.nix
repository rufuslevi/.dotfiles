{ inputs, pkgs, ... }:

{
  imports = [ ../../shared/home/home.nix ./rider.nix ];

  programs = import ./programs.nix { inherit inputs pkgs; };
  home.packages = import ./packages.nix { inherit pkgs; };
}
