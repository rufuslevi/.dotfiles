{ ... }:

{
  imports = [
    ./firefox.nix
    ./gamescope.nix
    ./hyprland.nix
    ./nix-ld.nix
    ./obs.nix
    ./partitionmanager.nix
    ./steam.nix
  ];

  programs.coolercontrol.enable = true;
  users.users.rufuslevi.extraGroups = [ "adbusers" ];
}
