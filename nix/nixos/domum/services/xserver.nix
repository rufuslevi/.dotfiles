{ ... }:

{
  services = {
    displayManager = {
      sddm = {
        enable = false;
        wayland.enable = true;
      };
      gdm = {
        enable = true;
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
