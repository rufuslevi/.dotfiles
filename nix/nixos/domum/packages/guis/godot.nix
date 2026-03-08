{
  pkgs,
  pkgs-stable,
  ...
}:

{
  programs.nix-ld = {
    enable = true;
    libraries = [
      pkgs.onetbb
    ];
  };

  environment.systemPackages = with pkgs; [
    godot
    pkgs-stable.godotPackages_4_6.godot
    gdtoolkit_4
    godotPackages.export-template
    xorg.xprop
  ];
}
