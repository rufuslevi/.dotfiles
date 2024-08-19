{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    volantes-cursors
    kdePackages.qtwebsockets
    kdePackages.qtwayland
    kdePackages.qtstyleplugin-kvantum
    kdePackages.qt6gtk2
    kdePackages.qt6ct
    kdePackages.systemsettings
    kdePackages.qtwayland
    kdePackages.qtstyleplugin-kvantum
    kdePackages.kwayland
    qt6.qmake
    qt6.qtwayland
    gsettings-desktop-schemas
  ];
}
