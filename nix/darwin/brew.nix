{ ... }:

{
  enable = true;
  global = { autoUpdate = true; };
  taps = [ "FelixKratz/formulae" ];
  casks = [
    "homebrew/cask-fonts/font-monaspace-nerd-font"
    "sigmaos"
    "vivaldi"
    "miniconda"
  ];
  brews =
    [ "borders" "koekeishiya/formulae/yabai" "koekeishiya/formulae/skhd" ];
}
