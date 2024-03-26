{ ... }:

{
  enable = true;
  configFile = {
    "btop/btop.conf" = { source = ../../btop/btop.conf; };
    "zsh" = {
      source = ../../zsh;
      recursive = true;
    };
  };
}
