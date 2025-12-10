{ pkgs, ... }:

{
  imports = [
    ./godot.nix
  ];

  environment.systemPackages = with pkgs; [
    (callPackage ./helium.nix { })
  ];
}
