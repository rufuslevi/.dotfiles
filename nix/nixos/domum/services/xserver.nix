{ pkgs, ... }:

{
  services = {
    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
        extraPackages = [
          pkgs.kdePackages.qt5compat
        ];
      };
    };
    xserver = {
      enable = true;
      videoDrivers = [ "amdgpu" ];
      xkb = {
        layout = "ca";
        variant = "multix";
      };
    };
  };
}
