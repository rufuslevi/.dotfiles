{ pkgs, pkgs-stable, ... }:

{
  environment.systemPackages = with pkgs; [
    jdk24
    temurin-bin
  ];
}
