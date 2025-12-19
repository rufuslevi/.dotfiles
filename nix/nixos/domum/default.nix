{ pkgs, hyprland, ... }:

{
  imports = [
    ./hardware
    ./packages
    ./programs
    ./services
    ./stylix.nix
    # ./theme.nix
    ./xdg
    ./hardware.nix
    ./networking.nix
  ];

  environment.pathsToLink = [
    "/share/xdg-desktop-portal"
    "/share/applications"
  ];

  home-manager = {
    backupFileExtension = "backup";
    users.rufuslevi = {
      home.stateVersion = "24.11";
      dconf.settings = {
        "org/gnome/desktop/wm/preferences" = {
          button-layout = "";
        };
        "org/gnome/desktop/interface" = {
          gtk-theme = "Dracula";
        };
        "org/gnome/desktop/wm/preferences" = {
          theme = "Dracula";
        };
        "org/gnome/desktop/interface" = {
          icon-theme = "Dracula";
        };
        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
        };
      };
    };
  };
}
