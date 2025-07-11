{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    android-tools
    bluetuith
    ckan
    evil-helix
    mpv
    nix-tree
    youtube-tui
  ];
}
