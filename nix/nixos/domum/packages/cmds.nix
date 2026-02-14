{
  agenix,
  pkgs,
  pkgs-stable,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    agenix.packages.${stdenv.hostPlatform.system}.default
    alsa-utils
    clinfo
    colord
    ddcutil
    # pkgs-stable.gdscript-formatter
    hyprpolkitagent
    hyprsunset
    imagemagick
    openconnect
    pngquant
    powershell
    wlr-randr
    xwayland-satellite
  ];
}
