{ ... }:

{
  imports = [ ./borders.nix ];

  services = { nix-daemon.enable = true; };
}
