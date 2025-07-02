{ pkgs, ... }:

{
  services = {
    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
      };
      gdm = {
        enable = false;
        wayland = true;
      };
    };
    desktopManager.gnome.enable = true;
    xserver = {
      enable = true;
      videoDrivers = [ "amdgpu" ];
      deviceSection = ''
        Option "TearFree" "False"
        Option "VariableRefresh" "True"
      '';
      xkb = {
        layout = "ca";
        variant = "multix";
      };
    };
  };
}
