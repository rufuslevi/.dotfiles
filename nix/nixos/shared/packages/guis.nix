{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    firefox-devedition
    gparted
    meld
  ];
}
