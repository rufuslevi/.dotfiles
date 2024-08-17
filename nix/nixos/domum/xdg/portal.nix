{ pkgs, ...}:

{
  xdg.portal = {
      enable = true;
      wlr = {
        enable = true;
      };
      extraPortals = [
        pkgs.xdg-desktop-portal-wlr
        pkgs.xdg-desktop-portal-hyprland
      ];
  };
}
