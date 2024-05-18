{ ... }:

{
  services.samba = {
    enable = true;
    securityType = "user";
    openFirewall = true;
    extraConfig = ''
      workgroup = WORKGROUP
      server string = smbnix
      netbios name = smbnix
      security = user 
      securityType = "user"
      hosts allow = 192.168.0. 127.0.0.1 localhost
      hosts deny = 0.0.0.0/0
      guest account = rufuslevi
      map to guest = bad user
    '';
  };
  services.samba-wsdd = {
    enable = true;
    openFirewall = true;
  };
}
