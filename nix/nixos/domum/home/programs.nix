{ inputs, pkgs, ... }:

{
  anyrun = {
    enable = false;
    config = {
      plugins = [
        inputs.anyrun.packages.${pkgs.system}.applications
        "${
          inputs.anyrun.packages.${pkgs.system}.anyrun-with-all-plugins
        }/lib/kidex"
      ];
      x = { fraction = 0.5; };
      y = { fraction = 0.3; };
      width = { fraction = 0.3; };
      hideIcons = false;
      ignoreExclusiveZones = false;
      layer = "overlay";
      hidePluginInfo = false;
      closeOnClick = false;
      showResultsImmediately = false;
      maxEntries = null;
    };
  };
}
