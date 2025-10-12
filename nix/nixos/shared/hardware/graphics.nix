{
  pkgs,
  pkgs-stable,
  ...
}:

{
  environment.variables.AMD_VULKAN_ICD = "RADV";

  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];

  environment.systemPackages = with pkgs; [
    glfw
    freetype
    gpu-viewer
    mesa-demos
    renderdoc
    shaderc
    tracy
    vulkan-headers
    vulkan-loader
    pkgs-stable.vulkan-tools
    vulkan-tools-lunarg
    vulkan-validation-layers
  ];

  hardware = {
    # amdgpu = {
    #   initrd.enable = true;
    #   opencl.enable = true;
    # };
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        rocmPackages.clr.icd
        vaapiVdpau
        vulkan-loader
        vulkan-validation-layers
        vulkan-extension-layer
      ];
    };
  };
}
