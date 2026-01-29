{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    feh
    gparted
    meld
  ];
}
