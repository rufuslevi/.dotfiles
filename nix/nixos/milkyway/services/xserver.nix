{ ... }:

{
  services.xserver = {
    enable = true;
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
