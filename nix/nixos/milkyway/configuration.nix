# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, inputs, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ../shared/configuration.nix ];

  hardware = import ./hardware.nix { inherit config; };
  services = import ./services.nix { };
  programs = import ./programs.nix { inherit pkgs; };

  nixpkgs.config.nvidia.acceptLicense = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    useGlobalPkgs = true;
    useUserPackages = true;
    users.rufuslevi = import ./home/home.nix;
  };

  boot.loader = {
    systemd-boot.enable = false;
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      device = "nodev";
      useOSProber = false;
      efiSupport = true;
      theme = "/boot/grub/themes/hyperfluent";
    };
  };

  networking = {
    hostName = "milkyway";
    firewall = {
      enable = true;
      allowedTCPPorts = [ 80 139 443 445 ];
      allowedUDPPorts = [ 137 138 34197 ];
    };
  };
}
