{ ... }:

{
  services.samba.shares = {
    transfer = {
      path = "/home/rufuslevi/transfer/";
      browseable = "yes";
      "read only" = "no";
      "guest ok" = "yes";
    };
  };
}
