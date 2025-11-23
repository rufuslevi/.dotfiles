{
  agenix,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    agenix.packages."${stdenv.hostPlatform.system}".default
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
  ];
}
