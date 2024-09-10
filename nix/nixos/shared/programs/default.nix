{ ... }:

{
  imports = [
    ./git.nix
    ./nix-ld.nix
    ./neovim.nix
    ./zsh.nix
  ];

  programs.dconf.enable = true;
  programs.java.enable = true;
}
