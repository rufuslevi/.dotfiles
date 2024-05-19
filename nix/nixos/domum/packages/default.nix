{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vesktop
    notion-app-enhanced
    vivaldi
    vivaldi-ffmpeg-codecs
    gnome.nautilus
    gdtoolkit
    bitmagnet
    github-desktop
    openrgb-with-all-plugins
    openrazer-daemon

    kitty
    guake
    thunderbird
    obsidian
    cider
    webcord
    caprine-bin
    bitwarden-desktop
    prismlauncher

    jetbrains.clion
    jetbrains.idea-ultimate
    unityhub
    dotnet-sdk_7
  ];
}
