{ pkgs, ... }:

{
  home.username = "rufuslevi";
  home.stateVersion = "22.05";

  xdg = { } // import ./xdg.nix { };
  programs = { } // import ./programs.nix { inherit pkgs; };
  home.packages = import ./packages.nix { inherit pkgs; };
}
