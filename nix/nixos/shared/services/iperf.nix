{ pkgs, ... }:

{
  services.iperf3 = {
    enable = true;
    package = pkgs.iperf;
    openFirewall = true;
  };
}
