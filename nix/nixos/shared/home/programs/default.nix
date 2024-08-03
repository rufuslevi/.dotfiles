{ pkgs, ... }:

{
  programs.home-manager = { enable = true; };
  programs.bat = { enable = true; };
  programs.zsh = {
    enable = true;
    plugins = [{
      name = "powerlevel10k";
      src = pkgs.zsh-powerlevel10k;
      file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    }];
  };

}
