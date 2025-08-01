{
  inputs = {
    nixos-stable.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixos-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixos-stable";
    };

    hyprland.url = "git+https://github.com/hyprwm/Hyprland";

    stylix.url = "github:danth/stylix/release-24.11";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixos-unstable";
    };

    anyrun = {
      url = "github:anyrun-org/anyrun";
      inputs.nixpkgs.follows = "nixos-stable";
    };
  };

  outputs =
    attrs@{
      nixos-stable,
      nixos-unstable,
      home-manager,
      hyprland,
      anyrun,
      quickshell,
      stylix,
      zen-browser,
      ...
    }:
    let
      system = "x86_64-linux";

      attrs.anyrun = anyrun;
      attrs.hyprland = hyprland;
      attrs.quickshell = quickshell;
      attrs.zen-browser = zen-browser;

      attrs.pkgs-stable = import nixos-stable {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
    in
    {
      nixosConfigurations.domum = nixos-unstable.lib.nixosSystem {
        system = system;
        specialArgs = attrs;
        modules = [
          home-manager.nixosModules.home-manager
          stylix.nixosModules.stylix
          ./default.nix
          ../shared
        ];
      };
    };
}
