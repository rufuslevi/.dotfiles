{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    alsa-utils
    clinfo
    ddcutil
    hyprpolkitagent
    imagemagick
    pngquant
    powershell
  ];
}
