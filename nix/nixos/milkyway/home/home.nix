{ pkgs, ... }:

{
  imports = [ ../../shared/home/dark_theme.nix ../../shared/home/home.nix ];

  home.packages = import ./packages.nix { inherit pkgs; };
}

