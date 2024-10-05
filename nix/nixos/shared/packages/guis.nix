{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    firefox-dev-edition
    gparted
  ];
}
