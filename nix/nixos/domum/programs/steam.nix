{ ... }:

{
  hardware.steam-hardware.enable = true;
  programs.steam = {
    enable = true;
    # package = pkgs.steam.override {
    #   privateTmp = false;
    # };
    gamescopeSession.enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };
}
