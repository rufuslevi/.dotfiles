{ ... }:

{
  services.xserver = {
    enable = true;
    displayManager = { sddm.enable = true; };
    xkb = {
      layout = "ca";
      variant = "multix";
    };
  };
}
