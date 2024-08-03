{ ... }:

{
  programs.zsh = {
    enable = true;
    shellInit = ''
      source ~/.config/zsh/.zshrc
    '';
  };
}
