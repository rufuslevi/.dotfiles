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
    openconnect
    pngquant
    powershell
    wlr-randr
  ];
}
