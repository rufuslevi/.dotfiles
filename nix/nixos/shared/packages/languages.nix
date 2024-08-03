{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    lua54Packages.jsregexp
    llvmPackages_17.clang-unwrapped
    lua-language-server
    stylua
    jdt-language-server
    marksman
    rust-analyzer
    nil
    nixfmt
    nixpkgs-fmt
    nixpkgs-lint
    go
    gopls
    python312
    python312Packages.pip
    python312Packages.pillow
    shfmt
    taplo
    openjdk16-bootstrap
    cargo
    rustc
    tree-sitter
    nodejs_21
    lua
    gcc
    temurin-bin-21
    gdtoolkit
    dotnet-sdk_7
  ];
}
