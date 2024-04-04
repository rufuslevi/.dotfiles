{ config, pkgs, lib, inputs, ... }:

{
  home.username = "rufuslevi";
  home.homeDirectory = "/home/rufuslevi";
  home.stateVersion = "23.11";

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      source = ~/.config/hypr/hypr.conf
      source = ~/.config/hypr/test-hypr.conf
    '';
  };

  services = {
    gammastep = {
      enable = true;
      provider = "manual";
      latitude = 45.50884;
      longitude = -73.58781;
    };
    darkman = {
      enable = true;
      settings = {
        lat = 45.5;
        lng = -73.6;
        usegeoclue = true;
      };
      lightModeScripts = {
        darkman = ''
          ~/.config/scripts/variable_nix_light.sh
        '';
      };
      darkModeScripts = {
        darkman = ''
          ~/.config/scripts/variable_nix_dark.sh
        '';
      };
    };
    playerctld = { enable = true; };
    flameshot = {
      enable = false;
      settings = { General = { showStartupLaunchMessage = false; }; };
    };
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

  xdg = { } // import ./xdg.nix { inherit config; };
  programs = { } // import ./programs.nix { inherit pkgs; };

  home.activation = {
    # https://github.com/philj56/tofi/issues/115#issuecomment-1701748297
    regenerateTofiCache = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      tofi_cache=${config.xdg.cacheHome}/tofi-drun
      [[ -f "$tofi_cache" ]] && rm "$tofi_cache"
    '';
  };

  home.packages = with pkgs; [
    selectdefaultapplication
    kdePackages.qtimageformats
    tmux
    speedtest-rs
    killall
    stow
    fuse3
    jq
    zoxide
    cargo
    rustc
    tree-sitter
    nodejs_21
    fd
    lua
    eza
    gcc
    lxqt.lxqt-policykit
    ripgrep
    libqalculate
    youtube-tui
    mpv
    vlc
    qbittorrent
    onedrive

    # KDE Tools
    kdePackages.kio
    kdePackages.kio-fuse
    kdePackages.dolphin
    # kdePackages.partitionmanager
    libsForQt5.partitionmanager
    p11-kit
    iftop

    # Git
    gitui
    lazygit
    gh

    dex
    krabby
    qpwgraph
    helvum
    swww
    waypaper
    wlogout
    cliphist
    at-spi2-atk
    w3m
    libcaca
    ueberzug
    cifs-utils

    #Theming
    volantes-cursors
    kdePackages.qtwebsockets
    kdePackages.qtwayland
    kdePackages.qtstyleplugin-kvantum
    kdePackages.qt6gtk2
    kdePackages.qt6ct
    libsForQt5.systemsettings
    libsForQt5.qt5ct
    libsForQt5.qt5.qtwayland
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qtstyleplugins
    libsForQt5.kwayland-integration
    qt6.qmake
    qt6.qtwayland
    gsettings-desktop-schemas

    # Fonts
    atkinson-hyperlegible
    font-awesome

    clipman
    lua54Packages.jsregexp
    llvmPackages_17.clang-unwrapped
    grimblast
    lua-language-server
    stylua
    jdt-language-server
    marksman
    rust-analyzer
    nil
    nixfmt
    nixpkgs-fmt
    nixpkgs-lint
    go
    gopls
    python312
    python312Packages.pip
    python312Packages.pillow
    shfmt
    taplo
  ];

}

