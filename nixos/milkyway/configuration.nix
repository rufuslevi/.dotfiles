# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, inputs, pkgs, ... }:

{
  #boot.initrd.kernelModules = [ "nvidia" ];
  #boot.extraModulePackages = [ config.boot.kernelPackages.nvidia_x11_legacy340 ];

  boot.kernelParams = [ "module_blacklist=i915" "module_blacklist=amdgpu" ];
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

  networking.hostName = "milkyway";
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 80 443 ];
    allowedUDPPorts = [ 34197 ];
  };

  nixpkgs.config.nvidia.acceptLicense = true;

  # Load nvidia driver for Xorg and Wayland
  hardware.nvidia = {
    # Modesetting is required.
    modesetting.enable = true;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    # Enable this if you have graphical corruption issues or application crashes after waking
    # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead 
    # of just the bare essentials.
    powerManagement.enable = false;

    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;

    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of 
    # supported GPUs is at: 
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
    # Only available from driver 515.43.04+
    # Currently alpha-quality/buggy, so false is currently the recommended setting.
    open = false;

    # Enable the Nvidia settings menu,
    # accessible via `nvidia-settings`.
    nvidiaSettings = true;

    package = config.boot.kernelPackages.nvidiaPackages.legacy_340;
  };

  services.openssh.ports = [ 22 443 2222 7422 ];
  services.xserver.videoDrivers = [ "nvidia" ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
