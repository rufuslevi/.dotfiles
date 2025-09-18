{ config, ... }:

{
  networking.firewall.allowedTCPPorts = [
    80
    443
  ];

  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    virtualHosts = {
      "rufuslevi.dev" = {
        addSSL = true;
        enableACME = true;
        locations = {
          "/jellyfin/" = {
            proxyPass = "http://127.0.0.1:8096/";
            proxyWebsockets = true;
          };
          "/nextcloud/" = {
            proxyPass = "http://127.0.0.1:8080/";
          };
        };
      };
      "${config.services.nextcloud.hostName}" = {
        listen = [
          {
            addr = "127.0.0.1";
            port = 8080;
          }
        ];
      };
    };
  };

  security.acme = {
    acceptTerms = true;
    defaults.email = "michaelroussel404@outlook.com";
  };
}
