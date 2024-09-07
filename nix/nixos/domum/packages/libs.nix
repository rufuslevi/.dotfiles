{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    openrazer-daemon
    glib
    logiops
    libinput
    libcamera
    kdePackages.kirigami
    kdePackages.kcmutils
    kdePackages.kservice
    wayland-scanner
  ];
}
