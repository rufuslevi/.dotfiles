{
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
        settings.misc.disable_watchdog_warning = true;
        package = null;
        portalPackage = null;
        systemd.variables = [ "--all" ];
      };
    };
  };

  programs.uwsm = {
    enable = config.options.hyprlandEnabled;
  };

  programs.xwayland.enable = config.options.hyprlandEnabled;
  programs.hyprland = {
    enable = config.options.hyprlandEnabled;
    withUWSM = true;
    xwayland.enable = true;
    package = hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };
  security.pam.services.hyprland.enableGnomeKeyring = config.options.hyprlandEnabled;
}
