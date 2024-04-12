{ pkgs, ... }:

with pkgs; [
  jellyfin
  jellyfin-web
  jellyfin-ffmpeg
  steam-run
]
