{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    volantes-cursors
    kdePackages.qtstyleplugin-kvantum
    kdePackages.qt6gtk2
    kdePackages.qt6ct
    gsettings-desktop-schemas
  ];
}
