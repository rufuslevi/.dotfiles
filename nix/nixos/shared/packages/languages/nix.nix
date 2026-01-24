{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nil
    nixd
    nixfmt
    nixpkgs-fmt
    nixpkgs-lint
  ];
}
