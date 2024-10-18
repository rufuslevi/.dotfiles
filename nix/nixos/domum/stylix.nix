{ pkgs, ... }:

{
  stylix = {
    enable = true;
    image = ../../../waypaper/assets/DSCF4379.JPEG;
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/monokai.yaml";
    # cursor = {
    #   name = "Volantes";
    #   package = pkgs.volantes-cursors;
    #   size = 24;
    # };
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
      grub = {
        enable = true;
      };
      gnome = {
        enable = true;
      };
      gtk.enable = true;
    };
  };
}
