{ pkgs, ... }:

{
  imports = [ ./go.nix ];

  environment.systemPackages = with pkgs; [
    cargo
    delve
    dotnet-sdk_7
    fish
    julia
    gcc
    gdtoolkit_4
    iferr
    impl
    jdt-language-server
    llvmPackages_17.clang-unwrapped
    lua
    lua-language-server
    lua51Packages.lua
    lua54Packages.jsregexp
    luarocks
    marksman
    mockgen
    nodejs_22
    nil
    nixfmt-rfc-style
    nixpkgs-fmt
    nixpkgs-lint
    php
    php84Packages.composer
    reftools
    ruby
    rust-analyzer
    python312
    python312Packages.pip
    python312Packages.pillow
    python312Packages.debugpy
    python312Packages.venvShellHook
    python312Packages.pylint-venv
    shfmt
    stylua
    taplo
    texliveFull
    rustc
    tree-sitter
    temurin-bin-21
  ];
}
