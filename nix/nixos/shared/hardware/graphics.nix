{ pkgs-stable, ... }:

{
  environment.variables.AMD_VULKAN_ICD = "RADV";

  hardware = {
    amdgpu = {
      initrd.enable = true;
      opencl.enable = true;
      amdvlk = {
        enable = true;
        support32Bit.enable = true;
      };
    };
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs-stable; [
        libva-utils
        vaapiVdpau
        libvdpau-va-gl
      ];
    };
  };
}
