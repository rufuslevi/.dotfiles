{ pkgs, ... }:

{
  dconf = {
    settings = {
      "org/gnome/desktop/wm/preferences".button-layout = "";
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-light";
      };
    };
  };

  gtk.theme = {
    name = "rose-pine-dawn";
    package = pkgs.rose-pine-gtk-theme;
  };

  xdg = {
    configFile = {
      "bat/config".text = ''--theme "Monokai Extended Light"'';
      # "qt6ct/qt6ct.conf" = {
      #   source = ../../../../../themes/qt6ct_light.conf;
      # };
      # "Kvantum/kvantum.kvconfig".text = ''
      #   [General]
      #   theme=GraphiteNord-rimless
      # '';
      "Kvantum/gruvbox-kvantum" = {
        source = ../../../../../themes/gruvbox-kvantum;
        recursive = true;
      };
      "Kvantum/GraphiteNord-rimless" = {
        source = ../../../../../themes/GraphiteNord-rimless;
        recursive = true;
      };
    };
  };
}
