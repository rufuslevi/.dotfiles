{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    python3
    python312Packages.pip
    python311
    pyenv
    pyright
    poetry
  ];
}
