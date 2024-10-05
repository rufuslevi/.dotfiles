{ ... }:

{
  imports = [
    ./drives.nix
    ./samba.nix
    ./ssh.nix
  ];

  services.dbus = {
    enable = true;
    implementation = "broker";
  };
}
