{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    volantes-cursors
    kdePackages.qtwebsockets
    kdePackages.qtwayland
    kdePackages.qtstyleplugin-kvantum
    kdePackages.qt6gtk2
    kdePackages.qt6ct
    libsForQt5.systemsettings
    libsForQt5.qt5ct
    libsForQt5.qt5.qtwayland
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qtstyleplugins
    libsForQt5.kwayland-integration
    qt6.qmake
    qt6.qtwayland
    gsettings-desktop-schemas
  ];
}
