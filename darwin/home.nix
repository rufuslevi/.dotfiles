{ pkgs, ... }:

{
  home.username = "rufuslevi";
  home.stateVersion = "22.05";

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  programs = {
    zsh = {
      enable = true;
      syntaxHighlighting.enable = true;
      enableAutosuggestions = true;
      plugins = [
        {
          name = "powerlevel10k";
          src = pkgs.zsh-powerlevel10k;
          file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        }
      ];
      oh-my-zsh = {
        enable = true;
        plugins = [ "git" "colored-man-pages" ];
      };
      initExtra = ''
        source ~/.config/zsh/.zshrc
        source ~/.config/zsh/.zshenv
        source ~/.config/zsh/.zprofile
        source ~/.config/zsh/.p10k.zsh
      '';
    };
    neovim = {
      enable = true;
    };
    btop = {
      enable = true;
    };
  };

  xdg = {
    enable = true;
    configFile = {
      "btop/btop.conf" = {
        source = ../btop/btop.conf;
      };
      "zsh" = {
        source = ../zsh;
        recursive = true;
      };
  };

  home.packages = with pkgs; [
    fantasque-sans-mono
    vscodium
    ripgrep
    wezterm
    btop
    nil
    nixpkgs-fmt
    zoxide
    lua
    skhd
    yabai
    neofetch
    gcc
    fzf
    rustc
    cargo
    llvm
  ];
}
