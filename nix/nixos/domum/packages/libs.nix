{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bzip3
    openrazer-daemon
    glib
    logiops
    libinput
    libcamera
    xorg.libxcb
    tk
    wayland-scanner
    xz
    zlib
  ];
}
