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
      xdgOpenUsePortal = true;
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
