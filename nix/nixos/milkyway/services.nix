{ ... }:

{
  xserver.videoDrivers = [ "nvidiaLegacy340" ];

  openssh.ports = [ 22 443 2222 7422 ];

  samba.shares = {
    films = {
      path = "/mnt/toshiba";
      browseable = "yes";
      "read only" = "no";
      "guest ok" = "yes";
    };
    series = {
      path = "/mnt/hitachi";
      browseable = "yes";
      "read only" = "no";
      "guest ok" = "yes";
    };
  };

  jellyfin = {
    enable = true;
    openFirewall = true;
    user = "jellyfin";
  };
}
