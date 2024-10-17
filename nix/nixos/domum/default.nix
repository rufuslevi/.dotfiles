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
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
    extra-substituters = [ "https://anyrun.cachix.org" ];
    extra-trusted-public-keys = [ "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s=" ];
  };

  environment.pathsToLink = [
    "/share/xdg-desktop-portal"
    "/share/xdg-desktop-portal/portals"
    "/share/applications"
  ];
}
