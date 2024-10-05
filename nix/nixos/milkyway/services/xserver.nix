{ ... }:

{
  services.xserver = {
    enable = true;
    videoDrivers = [ "amdgpu" ];
    xkb = {
      layout = "ca";
      variant = "multix";
    };
    desktopManager = {
      xfce = {
        enable = true;
      };
    };
    displayManager = {
      lightdm.enable = true;
    };
  };
}
