{ pkgs, ... }:

{
  nix-ld.enable = true;
  zsh = { enable = true; };
  git = {
    enable = true;
    lfs.enable = true;
  };
  neovim = {
    enable = true;
    defaultEditor = true;
  };
  hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  waybar = { enable = true; };
  dconf = { enable = true; };
  firefox = {
    enable = true;
    package = pkgs.firefox-devedition;
    preferences = {
      "browser.tabs.inTitlebar" = 0;
      "browser.compactmode.show" = true;
      "browser.tabs.closeWindowWithLastTab" = false;
      "browser.translations.automaticallyPopup" = false;
      "browser.translations.panelShown" = false;
      "svg.context-properties.content.enabled" = true;
      "intl.multilingual.enabled" = true;
      "widget.use-xdg-desktop-portal.file-picker" = 1;
      "widget.use-xdg-desktop-portal.location" = 1;
      "widget.use-xdg-desktop-portal.mime-handler" = 1;
      "widget.use-xdg-desktop-portal.open-uri" = 1;
      "widget.use-xdg-desktop-portal.settings" = 1;
    };
    preferencesStatus = "default";
    languagePacks = [ "fr" ];
  };
  nix-ld.libraries = with pkgs; [
    alsa-lib
    at-spi2-atk
    at-spi2-core
    atk
    cairo
    cups
    curl
    dbus
    expat
    fontconfig
    freetype
    fuse3
    gdk-pixbuf
    glib
    gtk3
    icu
    libGL
    libappindicator-gtk3
    libdrm
    libglvnd
    libnotify
    libunwind
    libusb1
    libuuid
    libxkbcommon
    libxml2
    mesa
    nspr
    nss
    openssl
    pango
    pipewire
    stdenv.cc.cc
    systemd
    vulkan-loader
    xorg.libX11
    xorg.libXScrnSaver
    xorg.libXcomposite
    xorg.libXcursor
    xorg.libXdamage
    xorg.libXext
    xorg.libXfixes
    xorg.libXi
    xorg.libXrandr
    xorg.libXrender
    xorg.libXtst
    xorg.libxcb
    xorg.libxkbfile
    xorg.libxshmfence
    zlib
  ];
}

