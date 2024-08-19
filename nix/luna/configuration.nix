{ pkgs, ... }:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.rufuslevi.imports = [ ./home ];
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

  environment.systemPackages = with pkgs; [
    nixfmt-rfc-style
  ];

  networking = { hostName = "luna"; };

  security.pam.enableSudoTouchIdAuth = true;

  users.users.rufuslevi = {
    name = "rufuslevi";
    home = "/Users/rufuslevi/";
    isHidden = false;
    shell = "/bin/zsh";
  };

  fonts = {
    packages = with pkgs;
      [
        (nerdfonts.override {
          fonts = [ "Monaspace" "SourceCodePro" "CascadiaCode" ];
        })

      ];
  };
}

