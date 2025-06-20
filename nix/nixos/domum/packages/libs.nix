{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bzip3
    corefonts
    freetype
    gdb
    ghostscript
    ghostscriptX
    glib
    gradle
    helvetica-neue-lt-std
    jansson
    logiops
    libinput
    libcamera
    libva-utils
    libvdpau-va-gl
    mesa
    mesa-demos
    netcat-gnu
    openrazer-daemon
    steam-devices-udev-rules
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
    xorg.libXcursor
    xorg.libXext
    xorg.libXi
    xorg.libXrandr
    xorg.libXrender
    xorg.libXxf86vm
    xorg.libXtst
    xorg.libX11
    xz
    zlib
  ];
}
