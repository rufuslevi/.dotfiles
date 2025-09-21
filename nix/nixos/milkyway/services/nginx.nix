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
            extraConfig = ''
              proxy_buffering off;
              client_max_body_size 512M;
              client_body_timeout 300s;
              client_body_buffer_size 512k;
              fastcgi_buffers 64 4K;

              # Enable gzip but do not remove ETag headers
              gzip on;
              gzip_vary on;
              gzip_comp_level 4;
              gzip_min_length 256;
              gzip_proxied expired no-cache no-store private no_last_modified no_etag auth;
              gzip_types application/atom+xml text/javascript application/javascript application/json application/ld+json application/manifest+json application/rss+xml application/vnd.geo+json application/vnd.ms-fontobject application/wasm application/x-font-ttf application/x-web-app-manifest+json application/xhtml+xml application/xml font/opentype image/bmp image/svg+xml image/x-icon text/cache-manifest text/css text/plain text/vcard text/vnd.rim.location.xloc text/vtt text/x-component text/x-cross-domain-policy;

              add_header Referrer-Policy                   "no-referrer"       always;
              add_header X-Content-Type-Options            "nosniff"           always;
              add_header X-Frame-Options                   "SAMEORIGIN"        always;
              add_header X-Permitted-Cross-Domain-Policies "none"              always;
              add_header X-Robots-Tag                      "noindex, nofollow" always;
              add_header X-XSS-Protection                  "1; mode=block"     always;

              # Remove X-Powered-By, which is an information leak
              fastcgi_hide_header X-Powered-By;
            '';
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
