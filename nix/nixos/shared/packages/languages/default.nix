{ pkgs, pkgs-stable, ... }:

{
  imports = [ ./go.nix ];

  environment.systemPackages = with pkgs; [
    cargo
    delve
    dotnet-sdk
    fish
    julia
    gcc
    gdtoolkit_4
    iferr
    impl
    jdt-language-server
    llvmPackages_17.clang-unwrapped
    # lua
    lua-language-server
    lua51Packages.lua
    lua54Packages.jsregexp
    luarocks
    marksman
    matlab-language-server
    mockgen
    nodejs_22
    nil
    nixfmt-rfc-style
    nixpkgs-fmt
    nixpkgs-lint
    reftools
    ruby
    rust-analyzer
    pkgs-stable.php
    python3
    python311
    pyenv
    pyright
    poetry
    prettierd
    shfmt
    sqlite
    stylua
    taplo
    texliveFull
    tcl
    typescript-language-server
    rustc
    tree-sitter
    temurin-bin-21
  ];
}
