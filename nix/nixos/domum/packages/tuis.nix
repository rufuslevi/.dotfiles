{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    android-tools
    android-udev-rules
    bluetuith
    ckan
    clipse
    evil-helix
    mpv
    nix-tree
    youtube-tui
    zellij
  ];
}
