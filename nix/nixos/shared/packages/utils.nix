{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    grimblast
    cifs-utils
    pciutils
    kitty
  ];
}
