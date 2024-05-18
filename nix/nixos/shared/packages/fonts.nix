{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    atkinson-hyperlegible
    font-awesome
  ];
}
