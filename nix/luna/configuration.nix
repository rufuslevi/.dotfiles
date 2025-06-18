{ ... }:

{
  nix = {
    settings = {
      experimental-features = "nix-command flakes";
    };
    extraOptions = ''
      auto-optimise-store = false
      experimental-features = nix-command flakes
    '';
  };

  nixpkgs = {
    config = {
      allowUnsupportdSystem = true;
      allowBroken = true;
    };
  };

  networking = {
    hostName = "luna";
  };

  users.users.rufuslevi = {
    name = "rufuslevi";
    home = "/Users/rufuslevi";
    isHidden = false;
    # shell = "/bin/zsh";
  };
}
