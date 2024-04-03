{ config, pkgs, lib, inputs, ... }:

{
  imports = [ ../shared/dark_theme.nix ../shared/configuration.nix ];

  home.packages = with pkgs; [ jellyfin jellyfin-web jellyfin-ffmpeg ];
}

