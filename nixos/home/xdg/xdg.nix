{ config, ... }:

let
  dconf_color = if config.darkmode then "prefer-dark" else "prefer-light";
  qt5ct_conf =
    if config.darkmode then
      ../../../themes/qt5ct_dark.conf
    else
      ../../../themes/qt5ct_light.conf;
  qt6ct_conf =
    if config.darkmode then
      ../../../themes/qt6ct_dark.conf
    else
      ../../../themes/qt6ct_light.conf;
  kvantum_theme =
    if config.darkmode then ''
      [General]
      theme=gruvbox-kvantum
    '' else ''
      [General]
      theme=GraphiteNord-rimless
    '';
  bat_theme =
    if config.darkmode then
      ''--theme "gruvbox-dark"''
    else
      ''--theme "Monokai Extended Light"'';
in
{
  imports = [ ../../variables.nix ];

  xdg = {
    portal = {
      config = {
        common = { "org.freedesktop.impl.portal.Settings" = "gtk"; };
      };
    };
    userDirs = {
      enable = true;
      desktop = "${config.home.homeDirectory}/Bureau";
      documents = "${config.home.homeDirectory}/Documents";
      download = "${config.home.homeDirectory}/Téléchargements";
      music = "${config.home.homeDirectory}/Musique";
      pictures = "${config.home.homeDirectory}/Images";
      publicShare = "${config.home.homeDirectory}/Public";
      templates = "${config.home.homeDirectory}/Modèles";
      videos = "${config.home.homeDirectory}/Vidéos";
    };
    mimeApps = {
      enable = true;
      associations.added = {
        "application/pdf" = [ "okularApplication_pdf.desktop" ];
        "application/json" = [ "nvim.desktop" ];
        "application/x-docbook+xml" = [ "nvim.desktop" ];
        "application/x-yaml" = [ "nvim.desktop" ];
        "application/yaml" = [ "org.kde.kate.desktop" ];
        "application/zip" = [ "org.kde.ark.desktop" ];
        "text/markdown" = [ "nvim.desktop" ];
        "text/plain" = [ "nvim.desktop;org.kde.kate.desktop" ];
        "text/x-cmake" = [ "nvim.desktop" ];
        "x-scheme-handler/http" = [
          "librewolf.desktop;firefox-developer-edition.desktop;firefox-devedition.desktop"
        ];
        "x-scheme-handler/https" = [
          "librewolf.desktop;firefox-developer-edition.desktop;firefox-devedition.desktop"
        ];
        "x-scheme-handler/chrome" =
          [ "firefox-developer-edition.desktop;firefox-devedition.desktop" ];
        "text/html" =
          [ "firefox-developer-edition.desktop;firefox-devedition.desktop" ];
        "application/x-extension-htm" =
          [ "firefox-developer-edition.desktop;firefox-devedition.desktop" ];
        "application/x-extension-html" =
          [ "firefox-developer-edition.desktop;firefox-devedition.desktop" ];
        "application/x-extension-shtml" =
          [ "firefox-developer-edition.desktop;firefox-devedition.desktop" ];
        "application/xhtml+xml" =
          [ "firefox-developer-edition.desktop;firefox-devedition.desktop" ];
        "application/x-extension-xhtml" =
          [ "firefox-developer-edition.desktop;firefox-devedition.desktop" ];
        "application/x-extension-xht" =
          [ "firefox-developer-edition.desktop;firefox-devedition.desktop" ];
      };
      defaultApplications = {
        "application/pdf" = [ "okularApplication_pdf.desktop" ];
        "application/json" = [ "nvim.desktop" ];
        "application/x-docbook+xml" = [ "nvim.desktop" ];
        "application/x-yaml" = [ "nvim.desktop" ];
        "application/yaml" = [ "org.kde.kate.desktop" ];
        "application/zip" = [ "org.kde.ark.desktop" ];
        "text/html" = [ "firefox-devedition.desktop" ];
        "text/markdown" = [ "nvim.desktop" ];
        "text/plain" = [ "nvim.desktop" ];
        "text/x-cmake" = [ "nvim.desktop" ];
        "x-scheme-handler/ame" = [ "cider.desktop" ];
        "x-scheme-handler/cider" = [ "cider.desktop" ];
        "x-scheme-handler/http" = [ "firefox-devedition.desktop" ];
        "x-scheme-handler/https" = [ "firefox-devedition.desktop" ];
        "x-scheme-handler/itms" = [ "cider.desktop" ];
        "x-scheme-handler/itmss" = [ "cider.desktop" ];
        "x-scheme-handler/music" = [ "cider.desktop" ];
        "x-scheme-handler/musics" = [ "cider.desktop" ];
        "x-scheme-handler/x-github-client" = [ "github-desktop.desktop" ];
        "x-scheme-handler/x-github-desktop-auth" = [ "github-desktop.desktop" ];
        "x-scheme-handler/chrome" = [ "firefox-devedition.desktop" ];
        "application/x-extension-htm" = [ "firefox-devedition.desktop" ];
        "application/x-extension-html" = [ "firefox-devedition.desktop" ];
        "application/x-extension-shtml" = [ "firefox-devedition.desktop" ];
        "application/xhtml+xml" = [ "firefox-devedition.desktop" ];
        "application/x-extension-xhtml" = [ "firefox-devedition.desktop" ];
        "application/x-extension-xht" = [ "firefox-devedition.desktop" ];
      };
    };
    configFile = {
      "tofi/config" = { source = ../../../tofi/config; };
      "hypr/hypr.conf" = { source = ../../../hypr/hypr.conf; };
      "waypaper/config.ini" = { source = ../../../waypaper/config.ini; };
      "scripts" = {
        source = ../../../scripts;
        recursive = true;
      };
      "waybar" = {
        source = ../../../waybar;
        recursive = true;
      };
      "bat/config".text = "${bat_theme}";
      "qt5ct/qt5ct.conf" = { source = qt5ct_conf; };
      "qt6ct/qt6ct.conf" = { source = qt6ct_conf; };
      "Kvantum/kvantum.kvconfig".text = kvantum_theme;
      "Kvantum/gruvbox-kvantum" = {
        source = ../../../themes/gruvbox-kvantum;
        recursive = true;
      };
      "Kvantum/GraphiteNord-rimless" = {
        source = ../../../themes/GraphiteNord-rimless;
        recursive = true;
      };
    };
  };
}
