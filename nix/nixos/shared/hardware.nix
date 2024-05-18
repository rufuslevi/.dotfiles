{ pkgs, ... }:

{
  bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Name = "Domum";
        ControllerMode = "dual";
        FastConnectable = "true";
        Experimental = "true";
      };
      Policy = { AutoEnable = "true"; };
    };
  };
  opengl = {
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

