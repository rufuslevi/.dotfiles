{ pkgs, ... }:

{
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
    fonts = {
      sizes = {
        applications = 10;
        desktop = 11;
        popups = 10;
        terminal = 11;
      };
      monospace = {
        name = "Monaspace";
        package = pkgs.monaspace;
      };
    };
    targets = {
      grub.enable = true;
      gnome.enable = true;
      gtk.enable = true;
    };
  };
}
