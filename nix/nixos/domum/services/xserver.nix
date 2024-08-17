{ ... }:

{
  services = {
    displayManager = {
      sddm.enable = true;
    };
    xserver = {
      enable = true;
      xkb = {
        layout = "ca";
        variant = "multix";
      };
    };
  };
}
