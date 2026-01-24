{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (prismlauncher.override {
      jdks = [
        jdk8
        javaPackages.compiler.temurin-bin.jre-8
        pkgs.zulu25
        javaPackages.compiler.openjdk25
        javaPackages.compiler.temurin-bin.jdk-25
      ];
    })
  ];
}
