{ ... }:

{
  services.displayManager = {
    lightdm.enable = true;
    defaultSession = "xfce";
  };
}
