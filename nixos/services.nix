{ ... }:

{
  xserver = {
    enable = true;
    displayManager = { sddm.enable = true; };
    xkb = {
      layout = "ca";
      variant = "multix";
    };
  };
  desktopManager.plasma6.enable = true;
  pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  mpd = {
    enable = true;
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "My PipeWire Output"
      }
    '';
  };
  samba = {
    enable = true;
    securityType = "user";
    openFirewall = true;
    extraConfig = ''
      workgroup = WORKGROUP
      server string = smbnix
      netbios name = smbnix
      security = user 
      hosts allow = 192.168.0. 127.0.0.1 localhost
      hosts deny = 0.0.0.0/0
      guest account = nobody
      map to guest = bad user
    '';
  };
  samba-wsdd = {
    enable = true;
    openFirewall = true;
  };
  gvfs = { enable = true; };
  openssh = { enable = true; };
}
