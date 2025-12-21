{ ... }:

{
  imports = [
    ./displayManager.nix
    ./jellyfin.nix
    ./iperf.nix
    ./mysql.nix
    ./nextcloud.nix
    ./nginx.nix
    ./samba.nix
    ./syncthing.nix
    ./xserver.nix
  ];
}
