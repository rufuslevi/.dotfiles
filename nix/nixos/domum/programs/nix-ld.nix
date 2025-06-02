{ pkgs, ... }:

{
  programs.nix-ld.libraries = with pkgs; [ 
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
