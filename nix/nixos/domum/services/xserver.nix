{ config, pkgs, ... }:

{
  services = {
    displayManager = {
      gdm = {
        enable = false;
        wayland = true;
      };
    };
    desktopManager.gnome.enable = config.options.gnomeEnabled;
  };

  services.greetd = {
    enable = true;
  };
  programs.regreet = {
    enable = true;
    settings = {
      application_prefer_dark_theme = true;
    };
  };
}
