{ pkgs, ... }:

{
  nix-ld.libraries = with pkgs; [ libnvidia-container ];
}
