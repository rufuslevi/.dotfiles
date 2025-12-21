{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    volantes-cursors
    kdePackages.qtwayland
    material-symbols
  ];
}
