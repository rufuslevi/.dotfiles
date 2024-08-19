{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cargo
    dotnet-sdk_7
    fish
    gcc
    gdtoolkit_4
    go
    gopls
    jdt-language-server
    llvmPackages_17.clang-unwrapped
    lua
    lua-language-server
    lua54Packages.jsregexp
    marksman
    nodejs_22
    nil
    nixfmt-rfc-style
    nixpkgs-fmt
    nixpkgs-lint
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
    rustc
    tree-sitter
    temurin-bin-21
  ];
}
