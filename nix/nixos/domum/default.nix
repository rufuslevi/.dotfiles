{ ... }:

{
  imports = [
    ../shared
    ./hardware
    ./packages
    ./programs
    ./services
    ./hardware.nix
    ./networking.nix
  ];
}
