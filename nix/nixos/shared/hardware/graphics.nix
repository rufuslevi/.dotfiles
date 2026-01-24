{
  pkgs,
  pkgs-stable,
  ...
}:

{
  environment.variables.AMD_VULKAN_ICD = "RADV";

  environment.systemPackages = with pkgs; [
    glfw
    gpu-viewer
    shaderc
    mesa-demos
    tracy
    vulkan-tools
    vulkan-tools-lunarg
    vulkan-headers
  ];

  hardware = {
    amdgpu = {
      opencl.enable = true;
      initrd.enable = true;
    };
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs-stable; [
        vulkan-headers
        vulkan-loader
        vulkan-validation-layers
        vulkan-extension-layer
        blender-hip
      ];
    };
  };

  # HIP work around
  systemd.tmpfiles.rules =
    let
      rocmEnv = pkgs.symlinkJoin {
        name = "rocm-combined";
        paths = with pkgs.rocmPackages; [
          rocblas
          hipblas
          clr
        ];
      };
    in
    [
      "L+    /opt/rocm   -    -    -     -    ${rocmEnv}"
    ];
}
