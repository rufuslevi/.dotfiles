{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (prismlauncher.override {
      jdks = [
        jdk8
        jdk17
        jdk21
        temurin-bin-8
        temurin-bin-17
        temurin-bin-21
        pkgs.zulu25
      ];
    })
  ];
}
