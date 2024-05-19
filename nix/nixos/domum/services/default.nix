{ ... }:

{
  imports = [ ./ssh.nix ./syncthing.nix ];

  services.printing.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.ddccontrol.enable = true;
  services.hardware.openrgb.enable = true;
}
