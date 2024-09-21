{ pkgs, ... }:

{
  nix = {
    settings = {
      experimental-features = "nix-command flakes";
    };
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
    nil
    nixfmt-rfc-style
  ];

  networking = {
    hostName = "luna";
  };

  users.users.rufuslevi = {
    name = "rufuslevi";
    home = "/Users/rufuslevi/";
    isHidden = false;
    shell = "/bin/zsh";
  };

  fonts = {
    packages = with pkgs; [
      (nerdfonts.override {
        fonts = [
          "Monaspace"
          "SourceCodePro"
          "CascadiaCode"
        ];
      })

    ];
  };
}
