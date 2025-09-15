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
      home.file.".config/uwsm/env-hyprland" = {
        text = "export AQ_DRM_DEVICES=\"/dev/dri/card0:/dev/dri/card1\"";
      };
      home.stateVersion = "24.11";
      stylix = {
        enable = true;
        autoEnable = false;
        image = ../../../backgrounds/dark_souls_bonfire_dark_souls_night_ruin_warrior_hd_games.jpg;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/monokai.yaml";
        cursor = {
          name = "Volantes Cursors";
          package = pkgs.volantes-cursors;
          size = 24;
        };
        fonts = {
          sizes = {
            applications = 11;
            desktop = 13;
            popups = 11;
            terminal = 11;
          };
          serif = {
            name = "Source Code Pro";
            package = pkgs.source-code-pro;
          };
          sansSerif = {
            name = "MonaspiceNe Nerd Font Regular";
            package = pkgs.nerd-fonts.monaspace;
          };
          monospace = {
            name = "Maple Mono NF";
            package = pkgs.maple-mono.NF;
          };
          emoji = {
            name = "Noto Color Emoji";
            package = pkgs.noto-fonts-color-emoji;
          };
        };
        targets = {
          kitty.enable = true;
          ghostty.enable = true;
          waybar = {
            enable = true;
            addCss = false;
          };
        };
      };
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
      wayland.windowManager.hyprland = {
        enable = true;
        systemd.enable = false;
        extraConfig = "source = $HOME/.config/hypr/hypr.conf";
        package = null;
        portalPackage = null;
        systemd.variables = [ "--all" ];
      };
      programs = {
        waybar = {
          enable = false;
          style = "@import \"styling.css\";";
        };
      };
    };
  };
}
