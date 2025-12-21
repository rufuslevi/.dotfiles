{ ... }:

{
  networking = {
    hostName = "milkyway";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [
        80
        139
        443
        445
        6969
        8384
        25565
      ];
      allowedUDPPorts = [
        137
        138
        6969
        34197
        21027
      ];
    };
  };
}
