{ config, ... }:

{
  services = {
    displayManager = {
      gdm = {
        enable = true;
        wayland = true;
      };
    };
    desktopManager.gnome.enable = config.options.gnomeEnabled;
  };
}
