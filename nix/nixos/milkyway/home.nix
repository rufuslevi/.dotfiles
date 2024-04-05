{ pkgs, ... }:

{
  imports = [ ../shared/home/dark_theme.nix ../shared/home/home.nix ];

  home.packages = with pkgs; [ jellyfin jellyfin-web jellyfin-ffmpeg ];
}

