{ ... }:

{
  imports = [ ./firefox.nix ./hyprland.nix ./steam.nix ];

  programs.waybar.enable = true;
}
