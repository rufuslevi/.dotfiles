{ pkgs, pkgs-stable, ... }:

{
  environment.systemPackages = with pkgs; [
    jdk21
    temurin-bin
  ];
}
