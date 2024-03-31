# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, pkgs, lib, ... }:

{
  boot.loader = {
    systemd-boot.enable = false;
    efi.canTouchEfiVariables = true;
    efi.efiSysMountPoint = "/boot/efi";
    grub = {
      enable = true;
      device = "nodev";
      useOSProber = false;
      efiSupport = true;
      theme = "/boot/grub/themes/hyperfluent";
      extraEntries = import ./grub-entries.nix;
    };
  };

  networking = {
    hostName = "domum";
    firewall = {
      enable = true;
      allowedTCPPorts = [ 80 443 ];
    };
  };

  hardware = { openrazer.enable = true; };

  services = {
    printing.enable = true;
    openssh.ports = [ 22 443 2222 7422 ];
    desktopManager.plasma6.enable = true;
    hardware.openrgb.enable = true;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [ ];

  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall =
        true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall =
        true; # Open ports in the firewall for Source Dedicated Server
    };
  };
}
