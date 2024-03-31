{ config, pkgs, lib, inputs, ... }:

{
  imports = [ ../shared/configuration.nix ];

  home.packages = with pkgs; [ ];
}

