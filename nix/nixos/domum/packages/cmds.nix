{ agenix, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    agenix.packages.${system}.default
    alsa-utils
    clinfo
    ddcutil
    hyprpolkitagent
    imagemagick
    pngquant
    powershell
  ];
}
