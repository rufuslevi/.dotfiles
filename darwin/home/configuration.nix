{ pkgs, ... }:

{
  home.username = "rufuslevi";
  home.stateVersion = "22.05";

  programs = { } // import ./programs.nix { inherit pkgs; };

  xdg = {
    enable = true;
    configFile = {
      "btop/btop.conf" = { source = ../../btop/btop.conf; };
      "zsh" = {
        source = ../../zsh;
        recursive = true;
      };
    };
  };

  home.packages = with pkgs; [
    krabby
    fantasque-sans-mono
    vscodium
    ripgrep
    wezterm
    btop
    nil
    nixfmt
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
