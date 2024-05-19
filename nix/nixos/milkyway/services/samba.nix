{ ... }:

{
  services.samba.shares = {
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
}
