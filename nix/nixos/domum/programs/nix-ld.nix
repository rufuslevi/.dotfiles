{ pkgs, ... }:

{
  programs.nix-ld.libraries = with pkgs; [
    sdl2-compat
    sdl3
    wayland
    wayland-protocols
    wayland-scanner
  ];
}
