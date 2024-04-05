{ config, pkgs, lib, ... }:

{
  home.username = "rufuslevi";
  home.homeDirectory = "/home/rufuslevi";
  home.stateVersion = "23.11";

  xdg = import ./xdg.nix { inherit config; };
  programs = import ./programs.nix { inherit pkgs; };
  services = import ./services.nix { };
  home.packages = import ./packages.nix { inherit pkgs; };

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      source = ~/.config/hypr/hypr.conf
      source = ~/.config/hypr/test-hypr.conf
    '';
  };

  gtk = {
    enable = true;
    cursorTheme = {
      name = "volantes_cursors";
      package = pkgs.volantes-cursors;
      size = 24;
    };
    iconTheme = {
      name = "Breeze";
      package = pkgs.kdePackages.breeze-gtk;
    };
  };

  qt = {
    enable = true;
    platformTheme = "qtct";
    style = { name = "kvantum"; };
  };

  home.activation = {
    # https://github.com/philj56/tofi/issues/115#issuecomment-1701748297
    regenerateTofiCache = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      tofi_cache=${config.xdg.cacheHome}/tofi-drun
      [[ -f "$tofi_cache" ]] && rm "$tofi_cache"
    '';
  };

}

