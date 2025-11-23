{ config, ... }:

{
  services = {
    displayManager = {
      sddm = {
        enable = false;
        wayland.enable = true;
      };
      gdm = {
        enable = true;
        wayland = true;
      };
    };
    desktopManager.gnome.enable = config.options.gnomeEnabled;
  };
}
