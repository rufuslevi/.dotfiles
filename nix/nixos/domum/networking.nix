{ pkgs, ... }:

{
  networking = {
    hostName = "domum";
    networkmanager = {
      plugins = [
        pkgs.networkmanager-openconnect
      ];
    };
    firewall = {
      enable = true;
      allowedTCPPorts = [
        80
        443
        24773
        25565
        47984
        47989
        48010
      ];
      allowedUDPPorts = [
        5353
        47998
        47999
        48000
        48002
        48010
      ];
    };
  };
}
