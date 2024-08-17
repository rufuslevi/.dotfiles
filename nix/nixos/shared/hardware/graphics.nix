{ pkgs, ... }:

{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      mesa
      intel-ocl
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
    ];
  };
}
