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
    godotPackages.export-template
    xorg.xprop
  ];
}
