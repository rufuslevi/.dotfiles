{ pkgs, ... }:

{
  gtk = {
    enable = true;
    cursorTheme = {
      name = "volantes_cursors";
      package = pkgs.volantes-cursors;
      size = 24;
    };
    iconTheme = {
      name = "Breeze";
      package = pkgs.kdePackages.breeze-gtk;
    };
  };

  qt = {
    enable = true;
    platformTheme = "qtct";
    style = { name = "kvantum"; };
  };
}
