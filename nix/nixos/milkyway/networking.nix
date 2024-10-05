{ ... }:

{
  networking = {
    hostName = "milkyway";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [ 80 139 443 445 6969 8384 22000 ];
      allowedUDPPorts = [ 137 138 6969 34197 22000 21027 ];
    };
  };
}
