{ ... }:

{
  imports = [
    ../shared
    ./programs
    ./services
    ./packages
    ./hardware.nix
    ./networking.nix
  ];

  nixpkgs.config.nvidia.acceptLicense = true;
  nix = {
    gc.dates = [ "weekly" ];
    optimise.dates = [ "weekly" ];
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
}
