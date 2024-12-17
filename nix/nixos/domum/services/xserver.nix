{ pkgs, ... }:

{
  services = {
    displayManager = {
      sddm = {
        enable = false;
        wayland.enable = false;
        extraPackages = [
          pkgs.kdePackages.qt5compat
        ];
      };
    };
    xserver = {
      enable = true;
      videoDrivers = [ "amdgpu" ];
      deviceSection = ''
        Option "TearFree" "False"
        Option "VariableRefresh" "True"
      '';
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
