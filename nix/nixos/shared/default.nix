# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ lib, pkgs, ... }:

{
  imports = [
    ./hardware
    ./xdg
    ./services
    ./programs
    ./packages
    ./locales.nix
    ./networking.nix
    ./security.nix
    ./users.nix
  ];

  nixpkgs.config = {
    allowUnfree = true;
  };
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  console.keyMap = "cf";

  fonts = {
    enableDefaultPackages = true;
    fontconfig = {
      enable = true;
      useEmbeddedBitmaps = true;
      defaultFonts = {
        serif = [ "Linux Libertine Display" ];
        sansSerif = [ "Atkinson Hyperlegible" ];
        monospace = [ "Maple Mono NF" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
    packages =
      with pkgs;
      [
        libertine
        nerd-fonts.dejavu-sans-mono
        nerd-fonts.monaspace
        nerd-fonts.sauce-code-pro
        nerd-fonts.caskaydia-mono
        atkinson-hyperlegible
        font-awesome
        helvetica-neue-lt-std
        noto-fonts-emoji-blob-bin
        noto-fonts-color-emoji
      ]
      ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.maple-mono);
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
