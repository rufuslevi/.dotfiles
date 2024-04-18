{ pkgs, ... }:

with pkgs; [
  openrgb-with-all-plugins
  openrazer-daemon

  kitty
  guake
  thunderbird
  obsidian
  cider
  webcord
  caprine-bin
  bitwarden-desktop
  prismlauncher

  jetbrains.clion
  jetbrains.idea-ultimate
  unityhub
  dotnet-sdk_7
]
