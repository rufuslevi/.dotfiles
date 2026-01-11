{ ... }:

{
  services.mpd = {
    enable = true;
    settings = {
      audio_output = [
        {
          type = "pipewire";
          name = "My PipeWire Output";
        }
      ];
    };
  };

  systemd = {
    sockets.mpd.listenStreams = [ "/run/mpd/socket" ];
    services.mpd.environment = {
      XDG_RUNTIME_DIR = "/run/user/1000";
    };
  };
}
