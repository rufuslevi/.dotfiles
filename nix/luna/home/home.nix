{ pkgs, ... }:

{
  home.username = "rufuslevi";
  home.stateVersion = "22.05";

  xdg = {
    enable = true;
  };
  home.packages = with pkgs; [
    nil
    nixfmt-rfc-style
  ];
}
