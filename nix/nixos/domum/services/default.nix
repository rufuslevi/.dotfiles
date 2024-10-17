{ ... }:

{
  imports = [
    ./libinput.nix
    ./mpd.nix
    ./ssh.nix
    ./syncthing.nix
    ./pipewire.nix
    ./xserver.nix
  ];

  services.printing.enable = true;
  services.desktopManager.plasma6.enable = false;
  services.ddccontrol.enable = true;
  services.hardware.openrgb.enable = true;
}
