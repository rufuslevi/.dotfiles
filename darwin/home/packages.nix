{ pkgs, ... }:

with pkgs; [
  # GUI apps
  qbittorrent
  obsidian
  vscodium
  wezterm

  # Fonts
  atkinson-hyperlegible
  font-awesome

  # Desktop tools
  skhd
  yabai

  # TUI tools
  neofetch
  btop
  krabby
  libqalculate

  # CLI tools
  zoxide
  fzf
  ripgrep
  eza
  stow
  speedtest-rs
  jq
  fd
  tree-sitter

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
]

