{ ... }:

{
  services = {
    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
      };
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
