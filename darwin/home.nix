{ config, pkgs, lib, home-manager, ... }:

{
    home.stateVersion = "22.05";

    programs.direnv.enable = true;
    programs.direnv.nix-direnv.enable = true;

    programs = {
      # zsh = {
      #   enable = true;
      # };
      btop = {
        enable = true;
      };
    };

    xdg = {
      enable = true;
      configFile {
        "btop/btop.conf" = {
          source = ../btop/btop.conf;
        };
      };
    };
}