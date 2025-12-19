{
  lib,
  config,
  pkgs,
  hyprland,
  ...
}:

{
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  home-manager = {
    users.rufuslevi = {
      wayland.windowManager.hyprland = {
        enable = true;
        systemd.enable = true;
        extraConfig = "source = $HOME/.config/hypr/hypr.conf";
        package = null;
        portalPackage = null;
        systemd.variables = [ "--all" ];
      };
    };
  };

  programs.uwsm = {
    enable = true;
  };

  programs.xwayland.enable = true;
  programs.hyprland = {
    enable = config.options.hyprlandEnabled;
    withUWSM = true;
    xwayland.enable = true;
    package = hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };
}
