{ ... }:

{
  imports = [ ./bluetooth.nix ./logitech.nix ];

  hardware.openrazer.enable = true;
}
