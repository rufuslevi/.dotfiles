{ pkgs, ... }:

{
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      mesa_drivers
      intel-ocl
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
    ];
  };
}
