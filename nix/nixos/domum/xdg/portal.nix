{ pkgs, pkgs-stable, ... }:

let
  applications = {
    "application/pdf" = [ "okularApplication_pdf.desktop" ];
    "application/json" = [ "nvim.desktop" ];
    "application/x-docbook+xml" = [ "nvim.desktop" ];
    "application/x-yaml" = [ "nvim.desktop" ];
    "application/yaml" = [ "org.kde.kate.desktop" ];
    "application/zip" = [ "org.kde.ark.desktop" ];
    "application/x-extension-htm" = [ "firefox-devedition.desktop" ];
    "application/x-extension-html" = [ "firefox-devedition.desktop" ];
    "application/x-extension-shtml" = [ "firefox-devedition.desktop" ];
    "application/x-extension-xhtml" = [ "firefox-devedition.desktop" ];
    "application/x-extension-xht" = [ "firefox-devedition.desktop" ];
    "application/xhtml+xml" = [ "firefox-devedition.desktop" ];
    "image/x-tga" = [ "org.kde.gwenview.desktop" ];
    "image/x-xcf" = [ "org.kde.gwenview.desktop" ];
    "image/webp" = [ "org.kde.gwenview.desktop" ];
    "image/vnd.adobe.photoshop" = [ "org.kde.gwenview.desktop" ];
    "image/tiff" = [ "org.kde.gwenview.desktop" ];
    "image/x-xpixmap" = [ "org.kde.gwenview.desktop" ];
    "image/x-xbitmap" = [ "org.kde.gwenview.desktop" ];
    "image/x-portable-pixmap" = [ "org.kde.gwenview.desktop" ];
    "image/x-portable-graymap" = [ "org.kde.gwenview.desktop" ];
    "image/x-portable-bitmap" = [ "org.kde.gwenview.desktop" ];
    "image/vnd.microsoft.icon" = [ "org.kde.gwenview.desktop" ];
    "image/x-icns" = [ "org.kde.gwenview.desktop" ];
    "image/x-eps" = [ "org.kde.gwenview.desktop" ];
    "image/bmp" = [ "org.kde.gwenview.desktop" ];
    "image/png" = [ "org.kde.gwenview.desktop" ];
    "image/jxl" = [ "org.kde.gwenview.desktop" ];
    "image/jpeg" = [ "org.kde.gwenview.desktop" ];
    "image/heif" = [ "org.kde.gwenview.desktop" ];
    "image/gif" = [ "org.kde.gwenview.desktop" ];
    "image/avif" = [ "org.kde.gwenview.desktop" ];
    "inode/directory" = [ "org.kde.dolphin.desktop" ];
    "text/plain" = [ "nvim.desktop" ];
    "text/markdown" = [ "nvim.desktop" ];
    "text/x-cmake" = [ "nvim.desktop" ];
    "text/html" = [ "firefox-devedition.desktop" ];
    "video/x-flv" = [ "vlc.desktop" ];
    "video/x-flic" = [ "vlc.desktop" ];
    "video/x-nxv" = [ "vlc.desktop" ];
    "video/x-anim" = [ "vlc.desktop" ];
    "video/dv" = [ "vlc.desktop" ];
    "video/vnd.mpegurl" = [ "vlc.desktop" ];
    "video/3gpp2" = [ "vlc.desktop" ];
    "video/3gpp" = [ "vlc.desktop" ];
    "video/webm" = [ "vlc.desktop" ];
    "video/x-matroska" = [ "vlc.desktop" ];
    "video/quicktime" = [ "vlc.desktop" ];
    "video/mp4" = [ "vlc.desktop" ];
    "video/mpeg" = [ "vlc.desktop" ];
    "video/mp2t" = [ "vlc.desktop" ];
    "video/vnd.rn-realvideo" = [ "vlc.desktop" ];
    "video/vnd.avi" = [ "vlc.desktop" ];
    "video/x-ms-wmv" = [ "vlc.desktop" ];
    "video/x-theora+ogg" = [ "vlc.desktop" ];
    "video/x-ogm+ogg" = [ "vlc.desktop" ];
    "video/ogg" = [ "vlc.desktop" ];
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
  };
in
{
  xdg = {
    mime = {
      enable = true;
      defaultApplications = applications;
      addedAssociations = applications;
    };
    menus = {
      enable = true;
    };
    icons = {
      enable = true;
    };
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      wlr = {
        enable = true;
      };
      config = {
        common = {
          default = [
            "gtk"
          ];
        };
        hyprland = {
          default = [
            "hyprland"
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
  };
}
