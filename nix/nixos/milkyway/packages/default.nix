{ agenix, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    agenix.packages."${system}".default
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
    godot_4
  ];
}
