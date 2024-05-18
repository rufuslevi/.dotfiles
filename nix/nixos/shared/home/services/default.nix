{ ... }:

{
  imports = [ ./darkman.nix ./flameshot.nix ./gammastep.nix ];

  services.playerctld = { enable = true; };
}
