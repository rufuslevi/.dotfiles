{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ddcutil
    imagemagick
    pngquant
  ];
}
