{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    btop
    cmatrix
    libqalculate
    neofetch
    tmux
    vim
    yazi
    zellij
  ];
}
