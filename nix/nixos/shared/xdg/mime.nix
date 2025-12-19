{ config, pkgs, ... }:

let
  browser = "Helium.desktop";
  file-explorer = "org.kde.dolphin.desktop";
  video-player = "org.kde.haruna.desktop";
  text-editor = "dev.zed.Zed.desktop";
  archiver = "org.kde.ark.desktop";
  git-client = "github-desktop.desktop";
  okular = "org.kde.okular.desktop";

  applications = {
    "application/pdf" = [ okular ];
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
    "image/x-tga" = [ okular ];
    "image/x-xcf" = [ okular ];
    "image/webp" = [ okular ];
    "image/vnd.adobe.photoshop" = [ okular ];
    "image/tiff" = [ okular ];
    "image/x-xpixmap" = [ okular ];
    "image/x-xbitmap" = [ okular ];
    "image/x-portable-pixmap" = [ okular ];
    "image/x-portable-graymap" = [ okular ];
    "image/x-portable-bitmap" = [ okular ];
    "image/vnd.microsoft.icon" = [ okular ];
    "image/x-icns" = [ okular ];
    "image/x-eps" = [ okular ];
    "image/bmp" = [ okular ];
    "image/png" = [ okular ];
    "image/jxl" = [ okular ];
    "image/jpeg" = [ okular ];
    "image/heif" = [ okular ];
    "image/gif" = [ okular ];
    "image/avif" = [ okular ];
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
    "video/quicktime" = [ video-player ];
    "video/mp4" = [ video-player ];
    "video/mpeg" = [ video-player ];
    "video/mp2t" = [ video-player ];
    "video/vnd.rn-realvideo" = [ video-player ];
    "video/vnd.avi" = [ video-player ];
    "video/x-matroska" = [ video-player ];
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
  home-manager = {
    users.rufuslevi = {
      xdg = {
        userDirs = {
          enable = true;
          desktop = "$HOME/Bureau";
          documents = "$HOME/Documents";
          download = "$HOME/Téléchargements";
          music = "$HOME/Musique";
          pictures = "$HOME/Images";
          publicShare = "$HOME/Public";
          templates = "$HOME/Modèles";
          videos = "$HOME/Vidéos";
        };
        mimeApps = {
          enable = true;
          associations.added = applications;
          defaultApplications = applications;
        };
      };
    };
  };
}
