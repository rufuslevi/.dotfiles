{ pkgs, ... }:

{
  stylix = {
    enable = true;
    autoEnable = false;
    homeManagerIntegration.autoImport = true;
    homeManagerIntegration.followSystem = false;
    image = ../../../waypaper/assets/dark_souls_bonfire_dark_souls_night_ruin_warrior_hd_games.jpg;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/monokai.yaml";
    cursor = {
      name = "Volantes Cursors";
      package = pkgs.volantes-cursors;
      size = 24;
    };
    targets = {
      grub.enable = true;
      gnome.enable = true;
      gtk.enable = true;
    };
  };
}
