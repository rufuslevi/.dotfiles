{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ginkgo
    go
    gofumpt
    golangci-lint
    golines
    gomodifytags
    gopls
    gotests
    gotestsum
    gotools
    govulncheck
    richgo
  ];
}
