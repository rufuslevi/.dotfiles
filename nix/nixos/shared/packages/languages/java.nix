{ pkgs, pkgs-stable, ... }:

{
  environment.systemPackages = with pkgs; [
    jdk8
    jre21_minimal
    openjdk8-bootstrap
    semeru-jre-bin
  ];
}
