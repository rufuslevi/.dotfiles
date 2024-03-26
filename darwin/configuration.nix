{ config, pkgs, lib, home-manager, ... }:

let user = "rufuslevi";
in {
  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  nix.extraOptions = ''
    auto-optimise-store = true
    experimental-features = nix-command flakes
  '';

  nixpkgs.config.allowUnsupportdSystem = true;
  nixpkgs.config.allowBroken = true;
  nix.settings.experimental-features = "nix-command flakes";

  networking = { hostName = "luna"; };

  security.pam.enableSudoTouchIdAuth = true;

  users.users.${user} = {
    name = "${user}";
    home = "/Users/${user}";
    isHidden = false;
    shell = pkgs.zsh;
  };

  homebrew = { } // import ./brew.nix { };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}

