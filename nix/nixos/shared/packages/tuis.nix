{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    libqalculate
    youtube-tui
    mpv
    neofetch
    vim
    btop
    bluetuith
    yazi
    cmatrix
    tmux
  ];
}
