{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    exfat
    exfatprogs
    libnotify
    at-spi2-atk
    libcaca
    p11-kit
    wlroots_0_18
    ntfs3g
  ];
}
