{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    libqalculate
    neofetch
    vim
    btop
    yazi
    cmatrix
    tmux
  ];
}
