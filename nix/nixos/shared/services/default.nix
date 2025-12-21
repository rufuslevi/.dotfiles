{ ... }:

{
  imports = [
    ./cachix.nix
    ./dbus.nix
    ./drives.nix
    ./pipewire.nix
    ./samba.nix
    ./ssh.nix
  ];

  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
}
