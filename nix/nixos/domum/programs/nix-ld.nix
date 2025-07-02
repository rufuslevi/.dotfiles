{ pkgs, pkgs-stable, ... }:

{
  programs.nix-ld.libraries = with pkgs; [ 
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
