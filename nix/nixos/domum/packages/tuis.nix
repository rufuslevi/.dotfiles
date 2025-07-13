{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    android-tools
    android-udev-rules
    bluetuith
    ckan
    evil-helix
    mpv
    nix-tree
    youtube-tui
    zellij
  ];
}
