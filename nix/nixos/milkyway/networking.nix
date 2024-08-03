{ ... }:

{
  networking = {
    hostName = "milkyway";
    firewall = {
      enable = true;
      allowedTCPPorts = [ 80 139 443 445 8384 22000 ];
      allowedUDPPorts = [ 137 138 34197 22000 21027 ];
    };
  };
}
