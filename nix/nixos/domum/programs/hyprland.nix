{ hyprland, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    package = hyprland.packages.${pkgs.system}.hyprland;
    xwayland.enable = true;
    portalPackage = hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland.override {
      inherit (pkgs) mesa;
    };
  };
}
