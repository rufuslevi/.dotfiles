{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    alsa-utils
    ddcutil
    hyprpolkitagent
    imagemagick
    pngquant
  ];
}
