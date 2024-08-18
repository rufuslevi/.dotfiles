{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    libnotify
    kdePackages.polkit-kde-agent-1
    at-spi2-atk
    libcaca
    p11-kit
    wlroots_0_18
  ];
}
