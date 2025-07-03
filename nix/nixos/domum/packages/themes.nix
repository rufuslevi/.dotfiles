{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    darkman
    volantes-cursors
    kdePackages.qtwayland
    material-symbols
  ];
}
