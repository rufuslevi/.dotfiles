{ pkgs, pkgs-stable, ... }:

{
  programs.nix-ld.libraries = with pkgs; [
    sdl2-compat
    sdl3
    pkgs-stable.tbb_2022_0
    wayland
    wayland-protocols
    wayland-scanner
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
