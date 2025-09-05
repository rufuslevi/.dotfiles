{ pkgs, ... }:

{
  imports = [
    ./bluetooth.nix
    ./logitech.nix
  ];

  hardware.openrazer.enable = true;
  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];
}
