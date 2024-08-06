{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
    godot_4
  ];
}
