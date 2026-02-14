{ config, pkgs, ... }:

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

  # services.greetd = {
  #   enable = true;
  # };
  # programs.regreet = {
  #   enable = true;
  #   settings = {
  #     application_prefer_dark_theme = true;
  #   };
  # };
}
