{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kdePackages.polkit-kde-agent-1
    exfat
    exfatprogs
    libnotify
    at-spi2-atk
    libcaca
    p11-kit
    wlroots_0_18
  ];
}
