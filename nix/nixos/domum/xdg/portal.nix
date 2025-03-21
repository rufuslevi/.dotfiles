{ ... }:

{
  xdg = {
    menus = {
      enable = true;
    };
    icons = {
      enable = true;
    };
    portal = {
      enable = true;
      xdgOpenUsePortal = false;
      wlr = {
        enable = true;
      };
      config = {
        common = {
          default = [
            "gtk"
          ];
        };
        hyprland = {
          default = [
            "hyprland"
            "gtk"
          ];
          "org.freedesktop.impl.portal.ScreenCast" = [
            "wlr"
          ];
        };
        gnome = {
          default = [
            "gnome"
          ];
        };
        kde = {
          default = [
            "kde"
          ];
        };
      };
    };
  };
}
