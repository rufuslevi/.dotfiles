{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ddcutil
    lm_sensors
  ];
}
