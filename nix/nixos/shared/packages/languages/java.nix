{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    jdk21
    javaPackages.compiler.openjdk25
    javaPackages.compiler.temurin-bin.jdk-25
    temurin-bin
  ];
}
