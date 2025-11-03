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
      ];
    };
  };
}
