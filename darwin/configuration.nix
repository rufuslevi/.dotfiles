{ config, pkgs, lib, home-manager, ... }:

let user = "rufuslevi";
in {
  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  nix = {
    settings = { experimental-features = "nix-command flakes"; };
    extraOptions = ''
      auto-optimise-store = true
      experimental-features = nix-command flakes
    '';
  };

  nixpkgs = {
    config = {
      allowUnsupportdSystem = true;
      allowBroken = true;
    };
  };

  security.pam.enableSudoTouchIdAuth = true;

  users.users.${user} = {
    name = "${user}";
    home = "/Users/${user}";
    isHidden = false;
    shell = pkgs.zsh;
  };

  networking = { hostName = "luna"; };
  homebrew = { } // import ./brew.nix { };

  system.stateVersion = 4;
}

