{ user, pkgs, homebrew-core, homebrew-cask, ... }:

{
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

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${user}.imports = [ ./home/configuration.nix ];
  };

  networking = { hostName = "luna"; };

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  security.pam.enableSudoTouchIdAuth = true;

  users.users.${user} = {
    name = "${user}";
    home = "/Users/${user}/";
    isHidden = false;
    shell = "zsh";
  };

  homebrew = { } // import ./brew.nix { };
  programs.zsh.enable = true;

  system.stateVersion = 4;
}

