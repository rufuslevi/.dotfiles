{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kdePackages.kio
    kdePackages.kio-fuse
    kdePackages.dolphin
    libsForQt5.partitionmanager

    dunst
    themechanger
    wezterm
    kitty
    pavucontrol
    pwvucontrol
    vlc
    gparted
    librewolf
    tofi
    wofi
    kate
    qbittorrent
    onedrive
    waypaper
    vscodium
    gimp
    qpwgraph
    helvum
    selectdefaultapplication
  ];
}

