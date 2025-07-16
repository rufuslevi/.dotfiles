{
  pkgs,
  pkgs-stable,
  hyprland,
  ...
}:

{
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
    # package = hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    # portalPackage = hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    package = pkgs-stable.hyprland;
    portalPackage = pkgs-stable.xdg-desktop-portal-hyprland;
  };
}
