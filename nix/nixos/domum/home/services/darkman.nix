{ ... }:

{
  services.darkman = {
    enable = true;
    settings = {
      lat = 45.5;
      lng = -73.6;
      usegeoclue = true;
    };
    lightModeScripts = {
      darkman = ''
        ~/.config/scripts/variable_nix_light.sh
      '';
    };
    darkModeScripts = {
      darkman = ''
        ~/.config/scripts/variable_nix_dark.sh
      '';
    };
  };
}
