{ ... }:

{
  imports =
    [ ./git.nix ./nix-ld.nix ./firefox.nix ./hyprland.nix ./neovim.nix ];

  programs.zsh.enable = true;
  programs.waybar.enable = true;
  programs.dconf.enable = true;
  programs.java.enable = true;
}
