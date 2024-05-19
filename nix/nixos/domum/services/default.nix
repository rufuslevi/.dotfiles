{ ... }:

{
  services.printing.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.ddccontrol.enable = true;
  services.hardware.openrgb.enable = true;

  services.openssh.ports = [ 22 443 2222 7422 ];

  services.syncthing = {
    enable = true;
    user = "rufuslevi";
    configDir = "/home/rufuslevi/.config/syncthing";
  };
}
