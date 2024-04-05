{ pkgs, ... }:

with pkgs; [
  selectdefaultapplication
  kdePackages.qtimageformats
  tmux
  speedtest-rs
  killall
  stow
  fuse3
  jq
  zoxide
  cargo
  rustc
  tree-sitter
  nodejs_21
  fd
  lua
  eza
  gcc
  lxqt.lxqt-policykit
  ripgrep
  libqalculate
  youtube-tui
  mpv
  vlc
  qbittorrent
  onedrive

  # KDE Tools
  kdePackages.kio
  kdePackages.kio-fuse
  kdePackages.dolphin
  # kdePackages.partitionmanager
  libsForQt5.partitionmanager
  p11-kit
  iftop

  # Git
  gitui
  lazygit
  gh

  dex
  krabby
  qpwgraph
  helvum
  swww
  waypaper
  wlogout
  cliphist
  at-spi2-atk
  w3m
  libcaca
  ueberzug
  cifs-utils

  #Theming
  volantes-cursors
  kdePackages.qtwebsockets
  kdePackages.qtwayland
  kdePackages.qtstyleplugin-kvantum
  kdePackages.qt6gtk2
  kdePackages.qt6ct
  libsForQt5.systemsettings
  libsForQt5.qt5ct
  libsForQt5.qt5.qtwayland
  libsForQt5.qtstyleplugin-kvantum
  libsForQt5.qtstyleplugins
  libsForQt5.kwayland-integration
  qt6.qmake
  qt6.qtwayland
  gsettings-desktop-schemas

  # Fonts
  atkinson-hyperlegible
  font-awesome

  clipman
  lua54Packages.jsregexp
  llvmPackages_17.clang-unwrapped
  grimblast
  lua-language-server
  stylua
  jdt-language-server
  marksman
  rust-analyzer
  nil
  nixfmt
  nixpkgs-fmt
  nixpkgs-lint
  go
  gopls
  python312
  python312Packages.pip
  python312Packages.pillow
  shfmt
  taplo
]

