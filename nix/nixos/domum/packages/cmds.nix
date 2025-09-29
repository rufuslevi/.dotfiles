{ agenix, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    agenix.packages.${system}.default
    alsa-utils
    clinfo
    colord
    ddcutil
    hyprpolkitagent
    hyprsunset
    imagemagick
    pngquant
    powershell
    wlr-randr
  ];
}
