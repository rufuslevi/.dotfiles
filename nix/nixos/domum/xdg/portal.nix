{ pkgs, ... }:

{
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config = {
      common = {
        default = [ "hyprland" ];
      };
    };
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };
}
