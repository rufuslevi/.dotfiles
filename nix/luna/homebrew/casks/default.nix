{ ... }:

{
  imports = [ ./guis.nix ];

  homebrew.casks = [
    "android-platform-tools"
    "homebrew/cask-fonts/font-monaspace-nerd-font"
    "temurin"
  ];
}
