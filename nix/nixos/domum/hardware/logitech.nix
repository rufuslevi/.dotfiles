{ pkgs, ... }:

{
  hardware.logitech = {
    wireless = {
      enable = true;
      enableGraphical = true; # for solaar to be included
    };
  };
}
