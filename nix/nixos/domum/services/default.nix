{ ... }:

{
  imports = [
    ./darkman.nix
    ./libinput.nix
    ./mpd.nix
    ./noctalia.nix
    ./samba.nix
    ./syncthing.nix
    ./xserver.nix
  ];

  services.joycond.enable = true;
  services.printing.enable = true;
  services.desktopManager.plasma6.enable = false;
  services.ddccontrol.enable = true;
  services.hardware.openrgb.enable = true;
  services.blueman.enable = true;
  services.speechd.enable = false;
  services.orca.enable = false;
  services.flatpak.enable = true;
}
