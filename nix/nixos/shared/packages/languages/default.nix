{ pkgs, pkgs-stable, ... }:

{
  imports = [
    ./go.nix
    ./java.nix
    ./nix.nix
  ];

  environment.systemPackages = with pkgs; [
    delve
    dotnet-sdk
    fish
    gcc
    gdtoolkit_4
    iferr
    impl
    jdt-language-server
    llvmPackages_21.clang-unwrapped
    lua-language-server
    lua51Packages.lua
    lua54Packages.jsregexp
    luarocks
    marksman
    matlab-language-server
    mockgen
    nodejs_22
    reftools
    ruby
    pkgs-stable.php
    python3
    python312Packages.pip
    python311
    pyenv
    pyright
    poetry
    prettierd
    shfmt
    simple-completion-language-server
    sqlite
    stylua
    taplo
    pkgs-stable.texliveFull
    tcl
    typescript-language-server
    tree-sitter
  ];
}
