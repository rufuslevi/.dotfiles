{ config, ... }:

let
  browser = "zen.desktop";
  file-explorer = "org.gnome.Nautilus.desktop";
  video-player = "vlc.desktop";
  text-editor = "dev.zed.Zed.desktop";
  archiver = "org.kde.ark.desktop";
  git-client = "github-desktop.desktop";

  applications = {
    "application/pdf" = [ "okularApplication_pdf.desktop" ];
    "application/zip" = [ archiver ];
    "application/json" = [ text-editor ];
    "application/x-docbook+xml" = [ text-editor ];
    "application/x-yaml" = [ text-editor ];
    "application/yaml" = [ text-editor ];
    "application/x-extension-htm" = [ browser ];
    "application/x-extension-html" = [ browser ];
    "application/x-extension-shtml" = [ browser ];
    "application/x-extension-xhtml" = [ browser ];
    "application/x-extension-xht" = [ browser ];
    "application/xhtml+xml" = [ browser ];
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
    "inode/directory" = [ file-explorer ];
    "text/html" = [ browser ];
    "text/plain" = [ text-editor ];
    "text/markdown" = [ text-editor ];
    "text/x-cmake" = [ text-editor ];
    "video/x-flv" = [ video-player ];
    "video/x-flic" = [ video-player ];
    "video/x-nxv" = [ video-player ];
    "video/x-anim" = [ video-player ];
    "video/dv" = [ video-player ];
    "video/vnd.mpegurl" = [ video-player ];
    "video/3gpp2" = [ video-player ];
    "video/3gpp" = [ video-player ];
    "video/webm" = [ video-player ];
    "video/x-matroska" = [ video-player ];
    "video/quicktime" = [ video-player ];
    "video/mp4" = [ video-player ];
    "video/mpeg" = [ video-player ];
    "video/mp2t" = [ video-player ];
    "video/vnd.rn-realvideo" = [ video-player ];
    "video/vnd.avi" = [ video-player ];
    "video/x-ms-wmv" = [ video-player ];
    "video/x-theora+ogg" = [ video-player ];
    "video/x-ogm+ogg" = [ video-player ];
    "video/ogg" = [ video-player ];
    "x-scheme-handler/http" = [ browser ];
    "x-scheme-handler/https" = [ browser ];
    "x-scheme-handler/chrome" = [ browser ];
    "x-scheme-handler/ame" = [ "cider.desktop" ];
    "x-scheme-handler/cider" = [ "cider.desktop" ];
    "x-scheme-handler/itms" = [ "cider.desktop" ];
    "x-scheme-handler/itmss" = [ "cider.desktop" ];
    "x-scheme-handler/music" = [ "cider.desktop" ];
    "x-scheme-handler/musics" = [ "cider.desktop" ];
    "x-scheme-handler/x-github-client" = [ git-client ];
    "x-scheme-handler/x-github-desktop-auth" = [ git-client ];
  };
in
{
  xdg.userDirs = {
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
  xdg.mimeApps = {
    enable = true;
    associations.added = applications;
    defaultApplications = applications;
  };
}
