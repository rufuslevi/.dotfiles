{ pkgs, ... }:

{
  services = {
    displayManager = {
      sddm = {
        enable = false;
        wayland.enable = true;
        extraPackages = [
          pkgs.kdePackages.qt5compat
        ];
      };
    };
    xserver = {
      enable = true;
      videoDrivers = [ "amdgpu" ];
      displayManager.gdm = {
        enable = true;
        wayland = true;
      };
      desktopManager.gnome.enable = true;
      xkb = {
        layout = "ca";
        variant = "multix";
      };
    };
  };
}
