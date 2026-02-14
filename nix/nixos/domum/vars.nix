{ lib, ... }:
with lib;

{
  options.options = {
    gnomeEnabled = mkOption {
      type = types.bool;
      default = false;
      description = "Enables Gnome Desktop Environment";
    };
    hyprlandEnabled = mkOption {
      type = types.bool;
      default = false;
      description = "Enables Hyprland Desktop Environment";
    };
    niriEnabled = mkOption {
      type = types.bool;
      default = true;
      description = "Enables Niri Desktop Environment";
    };
  };
}
