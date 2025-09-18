{ pkgs-stable, ... }:

{
  services.mysql = {
    enable = true;
    package = pkgs-stable.mariadb;
    ensureDatabases = [
      "nextcloud"
    ];
    ensureUsers = [
      {
        name = "nextcloud";
        ensurePermissions = {
          "nextcloud.*" = "ALL PRIVILEGES";
        };
      }
    ];
  };
}
