{ pkgs, pkgs-stable, ... }:

{
  environment.systemPackages = with pkgs; [
    gparted
    meld
    pkgs-stable.zed-editor
  ];
}
