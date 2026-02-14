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
      config = {
        common = {
          default = [ "gtk" ];
        };
        hyprland = lib.mkIf (config.options.hyprlandEnabled) {
          default = [
            "hyprland"
          ];
        };
        gnome = lib.mkIf (config.options.gnomeEnabled) {
          default = [
            "gnome"
          ];
        };
        niri = lib.mkIf (config.options.niriEnabled) {
          "org.freedesktop.impl.portal.Secret" = [
            "gnome-keyring"
          ];
        };
      };
    };
  };
}
