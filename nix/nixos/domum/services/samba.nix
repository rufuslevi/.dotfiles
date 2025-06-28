{ ... }:

{
  services.samba.settings = {
    transfer = {
      path = "/home/rufuslevi/transfer/";
      browseable = "yes";
      "read only" = "no";
      "guest ok" = "yes";
    };
  };
}
