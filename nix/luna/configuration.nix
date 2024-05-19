{ user, pkgs, ... }:

{
  homebrew = import ./brew.nix { };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${user}.imports = [ ./home ];
  };

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

  services = { nix-daemon.enable = true; };

  networking = { hostName = "luna"; };

  security.pam.enableSudoTouchIdAuth = true;

  users.users.${user} = {
    name = "${user}";
    home = "/Users/${user}/";
    isHidden = false;
    shell = "/bin/zsh";
  };

  fonts = {
    fontDir.enable = true;
    fonts = with pkgs;
      [
        (nerdfonts.override {
          fonts = [ "Monaspace" "SourceCodePro" "CascadiaCode" ];
        })

      ];
  };

  system.stateVersion = 4;
}

