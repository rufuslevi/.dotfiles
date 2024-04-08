{ ... }:

{
  enable = true;
  global = { autoUpdate = true; };
  taps = [ "koekeishiya/formulae" "homebrew/cask-fonts" ];
  casks = [
    "homebrew/cask-fonts/font-monaspace-nerd-font"
    "sigmaos"
    "vivaldi"
    "miniconda"
    "blender"
    "openrgb"
    "tomatobar"
    "qbittorrent"
    "obsidian"
    "vscodium"
    "wezterm"
    "utm"
    "slack"
    "messenger"
    "discord"
    "notion"
    "equinox"
    "jetbrains-toolbox"
    "spaceid"
    "jukebox"
  ];
  brews = [
    "borders"
    "cmatrix"
    # "koekeishiya/formulae/yabai"
    # "koekeishiya/formulae/skhd"
    "neofetch"
    "libqalculate"
    "yazi"
    "zoxide"
    "fzf"
    "ripgrep"
    "eza"
    "stow"
    "jq"
    "fd"
    "tree-sitter"
    "lua"
    "gcc"
    "rust"
    "node"
    "llvm"
    "java"
    "openjdk"
    "rust-analyzer"
    "go-task"
  ];
}
