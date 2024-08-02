{ ... }:

{
  imports = [ ./bluetooth.nix ./logitech.nix ];

  hardware.openrazer.enable = true;
  hardware.opengl.driSupport32Bit = true;
}
