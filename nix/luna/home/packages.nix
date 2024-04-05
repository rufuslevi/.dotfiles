{ pkgs, ... }:

with pkgs; [
  # GUI apps
  qbittorrent
  obsidian
  vscodium
  wezterm
  utm

  # GUI tools
  raycast

  # Fonts
  atkinson-hyperlegible
  font-awesome

  # TUI tools
  neofetch
  btop
  krabby
  libqalculate

  # CLI tools
  yazi
  zoxide
  fzf
  ripgrep
  eza
  stow
  speedtest-rs
  jq
  fd
  tree-sitter
  bat
  git-credential-manager

  # Languages
  lua
  gcc
  rustc
  cargo
  llvm
  nodejs_21

  # LSP
  nil
  nixfmt
  nixpkgs-fmt
  rust-analyzer
]

