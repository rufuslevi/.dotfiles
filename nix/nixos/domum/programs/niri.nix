{ config, pkgs, ... }:

{
  programs.niri.enable = config.options.niriEnabled;
  security.pam.services.niri.enableGnomeKeyring = config.options.niriEnabled;
  security.polkit.enable = true;
}
