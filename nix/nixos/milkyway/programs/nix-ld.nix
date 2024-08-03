{ pkgs, ... }:

{
  programs.nix-ld.libraries = with pkgs; [ libnvidia-container ];
}
