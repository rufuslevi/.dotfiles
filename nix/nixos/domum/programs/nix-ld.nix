{ pkgs, pkgs-stable, ... }:

{
  programs.nix-ld.libraries = with pkgs; [
    libsForQt5.qt5.qtgraphicaleffects
    qtcreator
    qt5.full
    qt6.full
    libsForQt5.full
    kdePackages.qt5compat
    kdePackages.qtdeclarative
    pkgs-stable.tbb_2022_0
    xorg.libXcursor
    xorg.libXext
    xorg.libXxf86vm
    xorg.libXi
    xorg.libXrandr
    xorg.libXrender
    xorg.libXtst
    xorg.libX11
  ];
}
