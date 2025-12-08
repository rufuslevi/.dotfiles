{ ... }:

{
  services.noctalia-shell = {
    enable = true;
    target = "graphical.target";
  };
}
