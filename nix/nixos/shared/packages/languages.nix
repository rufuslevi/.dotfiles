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
    nixfmt-rfc-style
    nixpkgs-fmt
    nixpkgs-lint
    go
    gopls
    python312
    python312Packages.pip
    python312Packages.pillow
    shfmt
    taplo
    cargo
    rustc
    tree-sitter
    nodejs_22
    lua
    gcc
    temurin-bin-21
    gdtoolkit_4
    dotnet-sdk_7
  ];
}
