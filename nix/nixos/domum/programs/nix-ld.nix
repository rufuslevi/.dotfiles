{ pkgs, ... }:

{
  programs.nix-ld.libraries = with pkgs; [ xorg.libXxf86vm ];
}
