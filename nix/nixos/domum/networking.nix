{ ... }:

{
  networking = {
    hostName = "domum";
    firewall = {
      enable = true;
      allowedTCPPorts = [
        80
        443
        25565
      ];
    };
  };
}
