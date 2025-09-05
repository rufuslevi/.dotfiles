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
        pkgs.xdg-desktop-portal-hyprland
      ];
      config = {
        hyprland = {
          default = [
            "hyprland"
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
