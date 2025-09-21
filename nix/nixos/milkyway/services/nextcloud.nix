{ config, pkgs-stable, ... }:

{
  users = {
    users.nextcloud = {
      uid = 1001;
      isSystemUser = true;
      extraGroups = [ "users" ];
    };
    groups = {
      nextcloud = {
        gid = 997;
        members = [ "nextcloud" ];
      };
    };
  };

  services.nextcloud = {
    enable = true;
    package = pkgs-stable.nextcloud31;
    https = true;
    hostName = "localhost";
    database.createLocally = true;
    maxUploadSize = "5G";
    config = {
      dbtype = "mysql";
      dbname = "nextcloud";
      adminuser = "admin";
      adminpassFile = config.age.secrets.nextcloud.path;
    };
    settings =
      let
        prot = "https";
        host = "rufuslevi.dev";
      in
      {
        overwriteprotocol = prot;
        overwritehost = host;
        overwrite.cli.url = "${prot}://${host}/";
        default_phone_region = "CA";
        mysql.utf8mb4 = true;
        trusted_domains = [
          "localhost"
          "192.168.0.*"
        ];
        trusted_proxies = [
          "localhost"
          "192.168.0.*"
          "rufuslevi.dev"
        ];
        enabledPreviewProviders = [
          "OC\\Preview\\BMP"
          "OC\\Preview\\GIF"
          "OC\\Preview\\JPEG"
          "OC\\Preview\\Krita"
          "OC\\Preview\\MarkDown"
          "OC\\Preview\\MP3"
          "OC\\Preview\\OpenDocument"
          "OC\\Preview\\PNG"
          "OC\\Preview\\TXT"
          "OC\\Preview\\XBitmap"
          "OC\\Preview\\HEIC"
        ];
      };
    phpOptions = {
      max_input_time = 3600;
      max_execution_time = 3600;
    };
  };

  systemd.services."nextcloud-setup" = {
    requires = [ "mysql.service" ];
    after = [ "mysql.service" ];
  };
}
