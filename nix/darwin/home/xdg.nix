{ ... }:

{
  enable = true;
  configFile = {
    "scripts" = {
      source = ../../../scripts;
      recursive = true;
    };
    "zsh" = {
      source = ../../../zsh;
      recursive = true;
    };
    "btop/btop.conf" = { source = ../../../btop/btop.conf; };
  };
}
