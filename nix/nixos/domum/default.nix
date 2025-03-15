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

  home-manager = {
    backupFileExtension = "backup";
    users.rufuslevi = {
      home.stateVersion = "24.11";
      stylix = {
        enable = true;
        autoEnable = false;
        image = ../../../waypaper/assets/dark_souls_bonfire_dark_souls_night_ruin_warrior_hd_games.jpg;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
        cursor = {
          name = "Volantes";
          package = pkgs.volantes-cursors;
          size = 24;
        };
        targets = {
          hyprland.enable = true;
          kitty.enable = true;
          ghostty.enable = true;
          gnome.enable = true;
          gtk.enable = true;
        };
      };
      gtk = {
        iconTheme = {
          name = "oomox-gruvbox-dark";
          package = pkgs.gruvbox-dark-icons-gtk;
        };
      };
      dconf.settings = {
        "org/gnome/desktop/wm/preferences" = {
          button-layout = "";
        };
      };
      wayland.windowManager.hyprland = {
        enable = true;
        extraConfig = "source = $HOME/.config/hypr/hypr.conf";
        package = hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
        portalPackage = hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
      };
    };
  };
}
