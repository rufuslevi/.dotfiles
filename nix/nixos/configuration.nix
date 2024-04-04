# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, pkgs, ... }:

{
  networking = {
    networkmanager.enable = true;
    defaultGateway = "192.168.0.1";
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

  hardware = {
    pulseaudio = { enable = false; };
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [
        mesa_drivers
        intel-ocl
        vaapiIntel
        vaapiVdpau
        libvdpau-va-gl
      ];
    };
  };

  console.keyMap = "cf";

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  users = {
    defaultUserShell = pkgs.zsh;
    users.rufuslevi = {
      isNormalUser = true;
      description = "Michael Roussel";
      extraGroups = [ "networkmanager" "wheel" "video" "render" ];
    };
  };

  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };

  systemd.sockets.mpd.listenStreams = [ "/run/mpd/socket" ];
  systemd.services.mpd.environment = { XDG_RUNTIME_DIR = "/run/user/1000"; };

  sound.enable = true;

  services = { } // import ./services.nix { };

  xdg = {
    autostart.enable = true;
    menus = { enable = true; };
    portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal
        pkgs.xdg-desktop-portal-gtk
        pkgs.kdePackages.xdg-desktop-portal-kde
        pkgs.xdg-desktop-portal-wlr
        pkgs.xdg-desktop-portal-hyprland
      ];
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    exfat
    gnome.gvfs
    unzip
    man-pages
    man-pages-posix
    udiskie
    cmake
    gnumake
    os-prober
    wget
    neofetch
    btop
    gparted
    vim
    libnotify
    dunst
    wl-clipboard
    themechanger
    wezterm
    kitty
    pavucontrol
    pwvucontrol
    playerctl
    brightnessctl
    bluetuith
    librewolf
    vivaldi
    kate
    yazi
    go-task
    hyprland-protocols
    hyprpicker
    hyprpaper
    eww
    tofi
    wofi
    xdg-utils
    xdg-ninja
    glib
  ];

  programs = { } // import ./programs.nix { inherit pkgs; };

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
