{ ... }:

{
  imports = [
    ./libinput.nix
    ./mpd.nix
    ./samba.nix
    ./ssh.nix
    ./syncthing.nix
    ./pipewire.nix
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
}
