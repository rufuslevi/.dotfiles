{ pkgs, ... }:

{
  imports = [
    ../shared
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
      home.stateVersion = "24.05";
      stylix = {
        enable = true;
        image = ../../../waypaper/assets/DSCF4379.JPEG;
        # base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
        base16Scheme = "${pkgs.base16-schemes}/share/themes/monokai.yaml";
        targets = {
          hyprland.enable = true;
          firefox.enable = true;
          kitty.enable = true;
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
      };
    };
  };
}
