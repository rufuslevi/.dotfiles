{ agenix, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    agenix.packages.${stdenv.hostPlatform.system}.default
    alsa-utils
    clinfo
    colord
    ddcutil
    gdscript-formatter
    hyprpolkitagent
    hyprsunset
    imagemagick
    openconnect
    pngquant
    powershell
    wlr-randr
  ];
}
