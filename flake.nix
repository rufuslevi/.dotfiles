{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-23.11-darwin";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
    };
    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    }; 
  };

  outputs = { self, darwin, nixpkgs, home-manager, ... }@inputs:
  let 
    user = "rufuslevi";
    hostname = "luna";
    system = "aarch64-darwin";
    specialArgs = { inherit user hostname; };

    inherit (darwin.lib) darwinSystem;
    inherit (inputs.nixpkgs-unstable.lib) attrValues makeOverridable optionalAttrs singleton;

    nixpkgsConfig = {
      config = { allowUnfree = true; };
      overlays = attrValues self.overlays ++ singleton (
        # Sub in x86 version of packages that don't build on Apple Silicon yet
        final: prev: (optionalAttrs (prev.stdenv.system == "aarch64-darwin") {
          inherit (final.pkgs-x86)
            idris2
            nix-index
            niv
            purescript;
        })
      );
    };      
  in {
    darwinConfigurations = rec {
      luna = darwinSystem {
        inherit system specialArgs;
        modules = [
          ./darwin/configuration.nix
          home-manager.darwinModules.home-manager {
            nixpkgs = nixpkgsConfig;
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.rufuslevi = import ./darwin/home.nix; 
          }
        ];
      };
    };
    
    overlays = {
        comma = final: prev: {
          comma = import inputs.comma { inherit (prev) pkgs; };
        };  
        apple-silicon = final: prev: optionalAttrs (prev.stdenv.system == "aarch64-darwin") {
          pkgs-x86 = import inputs.nixpkgs {
            system = "x86_64-darwin";
            inherit (nixpkgsConfig) config;
          };
        }; 
      };

    darwinModules = {
      security-pam = 
        # Upstream PR: https://github.com/LnL7/nix-darwin/pull/228
        { config, lib, pkgs, ... }:

        with lib;

        let
          cfg = config.security.pam;

          # Implementation Notes
          #
          # We don't use `environment.etc` because this would require that the user manually delete
          # `/etc/pam.d/sudo` which seems unwise given that applying the nix-darwin configuration requires
          # sudo. We also can't use `system.patchs` since it only runs once, and so won't patch in the
          # changes again after OS updates (which remove modifications to this file).
          #
          # As such, we resort to line addition/deletion in place using `sed`. We add a comment to the
          # added line that includes the name of the option, to make it easier to identify the line that
          # should be deleted when the option is disabled.
          mkSudoTouchIdAuthScript = isEnabled:
          let
            file   = "/etc/pam.d/sudo";
            option = "security.pam.enableSudoTouchIdAuth";
          in ''
            ${if isEnabled then ''
              # Enable sudo Touch ID authentication, if not already enabled
              if ! grep 'pam_tid.so' ${file} > /dev/null; then
                sed -i "" '2i\
              auth       sufficient     pam_tid.so # nix-darwin: ${option}
                ' ${file}
              fi
            '' else ''
              # Disable sudo Touch ID authentication, if added by nix-darwin
              if grep '${option}' ${file} > /dev/null; then
                sed -i "" '/${option}/d' ${file}
              fi
            ''}
          '';
        in

        {
          options = {
            security.pam.enableSudoTouchIdAuth = mkEnableOption ''
              Enable sudo authentication with Touch ID
              When enabled, this option adds the following line to /etc/pam.d/sudo:
                  auth       sufficient     pam_tid.so
              (Note that macOS resets this file when doing a system update. As such, sudo
              authentication with Touch ID won't work after a system update until the nix-darwin
              configuration is reapplied.)
            '';
          };

          config = {
            system.activationScripts.extraActivation.text = ''
              # PAM settings
              echo >&2 "setting up pam..."
              ${mkSudoTouchIdAuthScript cfg.enableSudoTouchIdAuth}
            '';
          };
        };
    };
  };
}
