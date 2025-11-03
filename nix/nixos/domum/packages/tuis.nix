{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    android-tools
    amdgpu_top
    bluetuith
    ckan
    clipse
    evil-helix
    mpv
    nix-tree
    youtube-tui
  ];
}
