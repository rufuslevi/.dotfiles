{
  lib,
  config,
  pkgs,
  ...
}:

{
  xdg = {
    menus.enable = true;
    icons.enable = true;
    portal = {
      enable = true;
      xdgOpenUsePortal = false;
      extraPortals = lib.mkIf (config.options.gnomeEnabled) [
        pkgs.xdg-desktop-portal-gtk
      ];
      config = {
        hyprland = lib.mkIf (config.options.gnomeEnabled) {
          default = [
            "hyprland"
          ];
        };
        gnome = lib.mkIf (config.options.gnomeEnabled) {
          default = [
            "gnome"
          ];
        };
      };
    };
  };
}
