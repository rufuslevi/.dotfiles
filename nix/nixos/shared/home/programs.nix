{ pkgs, ... }:

{
  home-manager = { enable = true; };
  bat = { enable = true; };
  zsh = {
    enable = true;
    plugins = [{
      name = "powerlevel10k";
      src = pkgs.zsh-powerlevel10k;
      file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    }];
  };
}
