{ ... }:

{
  printing.enable = true;

  desktopManager.plasma6.enable = true;

  openssh.ports = [ 22 443 2222 7422 ];

  hardware.openrgb.enable = true;

  syncthing = {
    enable = true;
    user = "rufuslevi";
    configDir = "/home/rufuslevi/.config/syncthing";
  };
}
