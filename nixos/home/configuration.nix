{ config, pkgs, lib, inputs, ... }:

{
  home.username = "rufuslevi";
  home.homeDirectory = "/home/rufuslevi";
  home.stateVersion = "23.11";

  dconf = {
    settings."org/gnome/desktop/wm/preferences".button-layout = "";
  };

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      source = ~/.config/hypr/hypr.conf
    '';
  };

  services = {
    gammastep = {
      enable = true;
      provider = "manual";
      latitude = 45.50884;
      longitude = -73.58781;
    };
    playerctld = {
      enable = true;
    };
  };

  gtk = {
    enable = true;
    cursorTheme = {
      name = "Catppuccin-Mocha-Dark";
      package = pkgs.catppuccin-cursors.mochaDark;
      size = 24;
    };
    theme = {
      name = "Catppuccin-Mocha-Compact-Mauve-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "mauve" ];
        size = "standard";
        tweaks = [ ];
        variant = "mocha";
      };
    };
    iconTheme = {
      name = "candy-icons";
      package = pkgs.candy-icons;
    };
  };

  xdg = {
    userDirs = {
      enable = true;
      desktop = "${config.home.homeDirectory}/Bureau";
      documents = "${config.home.homeDirectory}/Documents";
      download = "${config.home.homeDirectory}/Téléchargements";
      music = "${config.home.homeDirectory}/Musique";
      pictures = "${config.home.homeDirectory}/Images";
      publicShare = "${config.home.homeDirectory}/Public";
      templates = "${config.home.homeDirectory}/Modèles";
      videos = "${config.home.homeDirectory}/Vidéos";
    };
    configFile = {
      "tofi/config" = {
        source = ../../tofi/config;
      };
      "hypr/hypr.conf" = {
        source = ../../hypr/hypr.conf;
      };
      "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
      "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
      "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
    };
  };

  home.packages = with pkgs; [
    volantes-cursors
    notion-app-enhanced
    youtube-tui
    mpv
    obsidian
    cider
    webcord
    caprine-bin
    sublime4
    guake
    unityhub
    bitwarden-desktop
    github-desktop
    krabby
    gopls
    qpwgraph
    helvum
    lua54Packages.jsregexp
    llvmPackages_17.clang-unwrapped
    kdePackages.qtwebsockets
    kdePackages.qt6ct
    libsForQt5.applet-window-appmenu
    libsForQt5.qtstyleplugin-kvantum
    atkinson-hyperlegible
    gnome.gnome-tweaks
  ];

  programs = { } // import ./programs.nix { inherit pkgs; };

  home.activation = {
    # https://github.com/philj56/tofi/issues/115#issuecomment-1701748297
    regenerateTofiCache = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      tofi_cache=${config.xdg.cacheHome}/tofi-drun
      [[ -f "$tofi_cache" ]] && rm "$tofi_cache"
    '';
  };
}
