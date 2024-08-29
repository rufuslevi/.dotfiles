{ pkgs, ... }:

{
  direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
  zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "colored-man-pages"
      ];
    };
    initExtra = ''
      source ~/.config/zsh/.zshrc
    '';
  };
  neovim = {
    enable = true;
    defaultEditor = true;
  };
}
