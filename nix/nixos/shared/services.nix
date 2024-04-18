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
  pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    extraConfig.pipewire."92-low-latency" = {
      context.properties = {
        default.clock.rate = 96000;
        default.clock.allowed-rates = [ 44100 48000 96000 192000 ];
        default.clock.quantum = 1024;
        default.clock.min-quantum = 16;
        default.clock.max-quantum = 2048;
        default.clock.quantum-limit = 8192;
        default.video.rate.num = 25;
        default.video.rate.denom = 1;
        settings.check-quantum = false;
        settings.check-rate = false;
      };
    };
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
      securityType = "user"
      hosts allow = 192.168.0. 127.0.0.1 localhost
      hosts deny = 0.0.0.0/0
      guest account = rufuslevi
      map to guest = bad user
    '';
  };
  samba-wsdd = {
    enable = true;
    openFirewall = true;
  };
  devmon.enable = true;
  gvfs = { enable = true; };
  udisks2.enable = true;
  openssh = {
    enable = true;
    settings = { PasswordAuthentication = false; };
  };
}
