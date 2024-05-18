# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, ... }:

{
  imports = [ ./hardware ./xdg ./services ];

  programs = import ./programs.nix { inherit pkgs; };
  environment.systemPackages = import ./packages.nix { inherit pkgs; };

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking = {
    networkmanager.enable = true;
    wireless.userControlled.enable = true;
  };

  time.timeZone = "America/New_York";

  i18n = {
    defaultLocale = "fr_CA.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "fr_CA.UTF-8";
      LC_IDENTIFICATION = "fr_CA.UTF-8";
      LC_MEASUREMENT = "fr_CA.UTF-8";
      LC_MONETARY = "fr_CA.UTF-8";
      LC_NAME = "fr_CA.UTF-8";
      LC_NUMERIC = "fr_CA.UTF-8";
      LC_PAPER = "fr_CA.UTF-8";
      LC_TELEPHONE = "fr_CA.UTF-8";
      LC_TIME = "fr_CA.UTF-8";
    };
  };

  console.keyMap = "cf";

  users = {
    defaultUserShell = pkgs.zsh;
    users.rufuslevi = {
      createHome = true;
      homeMode = "750";
      isNormalUser = true;
      description = "Michael Roussel";
      extraGroups = [ "networkmanager" "wheel" "video" "render" ];
    };
  };

  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };

  systemd = {
    sockets.mpd.listenStreams = [ "/run/mpd/socket" ];
    services.mpd.environment = { XDG_RUNTIME_DIR = "/run/user/1000"; };
  };

  sound.enable = true;

  fonts.packages = with pkgs;
    [
      (nerdfonts.override {
        fonts = [ "Monaspace" "SourceCodePro" "CascadiaCode" ];
      })
    ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
