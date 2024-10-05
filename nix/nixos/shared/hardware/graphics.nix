{ pkgs, ... }:

{
  hardware = {
    amdgpu = {
      initrd.enable = true;
      amdvlk = {
        enable = false;
      };
    };
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        mesa
        vaapiVdpau
        libvdpau-va-gl
      ];
    };
  };
}
