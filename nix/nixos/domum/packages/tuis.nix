{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ youtube-tui mpv bluetuith ];
}
