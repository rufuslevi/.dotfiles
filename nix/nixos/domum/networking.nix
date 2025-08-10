{ ... }:

{
  networking = {
    hostName = "domum";
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
