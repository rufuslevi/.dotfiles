{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    lua-language-server
    lua51Packages.lua
    lua54Packages.jsregexp
    luarocks
  ];
}
