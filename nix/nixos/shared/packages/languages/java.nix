{ pkgs, pkgs-stable, ... }:

{
  environment.systemPackages = with pkgs; [
    jdk8
    jre21_minimal
    jdk21_headless
    openjdk8-bootstrap
    semeru-jre-bin
    temurin-bin
    temurin-bin-21
  ];
}
