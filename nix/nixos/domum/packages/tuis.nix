{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    evil-helix
    youtube-tui
    mpv
    bluetuith
    ckan
  ];
}
