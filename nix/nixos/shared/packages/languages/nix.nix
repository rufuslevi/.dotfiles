{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nil
    nixd
    nixfmt-rfc-style
    nixpkgs-fmt
    nixpkgs-lint
  ];
}
