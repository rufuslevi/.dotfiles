{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bluetuith
    ckan
    evil-helix
    mpv
    youtube-tui
  ];
}
