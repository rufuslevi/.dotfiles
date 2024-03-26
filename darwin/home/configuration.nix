{ pkgs, ... }:

{
  home.username = "rufuslevi";
  home.stateVersion = "22.05";

  programs = { } // import ./programs.nix { inherit pkgs; };

  xdg = {
    enable = true;
    configFile = {
      "btop/btop.conf" = { source = ../../btop/btop.conf; };
      "zsh" = {
        source = ../../zsh;
        recursive = true;
      };
    };
  };

  home.packages = import ./packages.nix { inherit pkgs; };
}
