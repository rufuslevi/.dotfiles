{ pkgs, pkgs-stable, ... }:

{
  environment.systemPackages = with pkgs; [
    # Hyprland
    pkgs-stable.hyprland-protocols
    pkgs-stable.hyprpicker
    pkgs-stable.xdg-desktop-portal
    pkgs.xdg-desktop-portal-hyprland
    pkgs-stable.xdg-desktop-portal-gtk
    kdePackages.xdg-desktop-portal-kde

    bat
    hwinfo
    smartmontools
    iftop
    clipman
    eww
    swww
    wlogout
    cliphist
    exfat
    gnome.gvfs
    man-pages
    man-pages-posix
    udiskie
    cmake
    gnumake
    os-prober
    wget
    docker
    unzip
    speedtest-rs
    killall
    stow
    eza
    ripgrep
    fuse3
    jq
    zoxide
    fd
    fzf
    playerctl
    brightnessctl
    go-task
    wl-clipboard
    steam-run
    xdg-utils
    xdg-ninja
    polonium
  ];
}
