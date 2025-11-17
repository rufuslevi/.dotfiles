{
  pkgs,
  pkgs-stable,
  ...
}:

{
  programs.nix-ld = {
    enable = true;
    libraries = [
      pkgs-stable.tbb_2022_0
    ];
  };

  environment.systemPackages = with pkgs; [
    godot
    godotPackages.export-template
    godotPackages_4_4.godot
    xorg.xprop
  ];
}
