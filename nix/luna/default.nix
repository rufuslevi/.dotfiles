{ ... }:

{
  imports = [ ./homebrew ./services ./configuration.nix ./system.nix ];

  programs.zsh = {
    enable = true;
    shellInit = "source ~/.config/zsh/.zshrc";
  };
}
