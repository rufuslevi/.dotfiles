# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ../shared/configuration.nix ];

  hardware = import ./hardware.nix { };
  services = import ./services.nix { };
  programs = import ./programs.nix { };
  environment.systemPackages = import ./packages.nix { inherit pkgs; };

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
}
