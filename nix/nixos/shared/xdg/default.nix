{ ... }:

{
  imports = [
    ./mime.nix
  ];

  xdg = {
    autostart.enable = true;
    menus = {
      enable = true;
    };
  };
}
