{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    alsa-utils
    ddcutil
    imagemagick
    pngquant
  ];
}
