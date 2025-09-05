{
  pkgs,
  pkgs-stable,
  hyprland,
  ...
}:

{
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  programs.uwsm = {
    enable = false;
    package = pkgs.uwsm;
  };

  programs.hyprland = {
    enable = true;
    withUWSM = false;
    xwayland.enable = true;
    # package = hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    # portalPackage = hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    package = pkgs.hyprland;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
  };
}
