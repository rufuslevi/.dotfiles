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
          hyprland.enable = true;
          kitty.enable = true;
          ghostty.enable = true;
          gnome.enable = true;
          gtk.enable = true;
          waybar = {
            enable = true;
            addCss = false;
          };
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
      xdg.portal = {
        enable = true;
        xdgOpenUsePortal = false;
        # wlr = {
        #   enable = true;
        # };
        config = {
          common = {
            default = [
              "gtk"
            ];
          };
          hyprland = {
            default = [
              "hyprland"
              "gtk"
            ];
            "org.freedesktop.impl.portal.ScreenCast" = [
              "wlr"
            ];
          };
          gnome = {
            default = [
              "gnome"
            ];
          };
          kde = {
            default = [
              "kde"
            ];
          };
        };
      };
      programs = {
        waybar = {
          enable = true;
          style = "@import \"styling.css\";";
        };
      };
    };
  };
}
