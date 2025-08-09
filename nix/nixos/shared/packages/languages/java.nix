{ pkgs, pkgs-stable, ... }:

{
  environment.systemPackages = with pkgs; [
    pkgs-stable.jdk8
    jre21_minimal
    jdk21_headless
    semeru-jre-bin
    temurin-bin
    temurin-bin-21
  ];
}
