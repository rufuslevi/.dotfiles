{ config, pkgs, lib, home-manager, ... }:

let 
  user = "rufuslevi";
in {
  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  nix.extraOptions = ''
    auto-optimise-store = true
    experimental-features = nix-command flakes
  '';
  # + lib.optionalString (pkgs.system == "aarch64-darwin") ''
  #   extra-platforms = x86_64-darwin aarch64-darwin
  # '';

  nixpkgs.config.allowUnsupportdSystem = true;
  nixpkgs.config.allowBroken = true;
  nix.settings.experimental-features = "nix-command flakes";

  security.pam.enableSudoTouchIdAuth = true;

  users.users.${user} = {
    name = "${user}";
    home = "/Users/${user}";
    isHidden = false;
    shell = pkgs.zsh;
  };

  programs = {
    zsh = {
      enable = true;
    };
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}

