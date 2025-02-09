{ ... }:

{
  imports = [ ./guis.nix ];

  homebrew.casks = [
    "android-platform-tools"
    "flutter"
    "homebrew/cask-fonts/font-monaspace-nerd-font"
    "temurin"
  ];
}
