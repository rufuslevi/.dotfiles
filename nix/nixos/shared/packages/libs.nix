{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    libnotify
    glib
    lxqt.lxqt-policykit
    at-spi2-atk
    libcaca
    p11-kit
  ];
}
