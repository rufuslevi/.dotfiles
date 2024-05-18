{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ gitui lazygit gh ];
}
