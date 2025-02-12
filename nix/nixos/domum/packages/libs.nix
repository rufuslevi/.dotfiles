{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bzip3
    openrazer-daemon
    gdb
    glib
    jansson
    logiops
    libinput
    libcamera
    libva-utils
    libvdpau-va-gl
    mesa
    mesa-demos
    tk
    vaapiVdpau
    vkbasalt
    vulkan-loader
    vulkan-tools
    vulkan-validation-layers
    wayland-scanner
    wine
    wineWowPackages.stable
    winetricks
    xorg.libxcb
    xz
    zlib
  ];
}
