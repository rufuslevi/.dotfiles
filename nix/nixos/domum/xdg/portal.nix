{
  pkgs,
  ...
}:

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
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
      ];
      config = {
        hyprland = {
          default = [
            "hyprland"
            "gtk"
          ];
        };
        gnome = {
          default = [
            "gnome"
          ];
        };
      };
    };
  };
}
