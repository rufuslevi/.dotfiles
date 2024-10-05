{ ... }:

{
  imports = [
    ../shared
    ./hardware
    ./packages
    ./programs
    ./services
    ./xdg
    ./hardware.nix
    ./networking.nix
  ];

  nix.settings = {
    builders-use-substitutes = true;
    # extra substituters to add
    extra-substituters = [ "https://anyrun.cachix.org" ];

    extra-trusted-public-keys = [ "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s=" ];
  };

  environment.pathsToLink = [
    "/share/xdg-desktop-portal"
    "/share/xdg-desktop-portal/portals"
    "/share/applications"
  ];
}
