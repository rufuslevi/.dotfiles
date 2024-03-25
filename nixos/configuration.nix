# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, pkgs, ... }:

{
  # Bootloader.
  boot.loader = {
    systemd-boot.enable = false;
    efi.canTouchEfiVariables = true;
    efi.efiSysMountPoint = "/boot/efi";
    grub = {
      enable = true;
      device = "nodev";
      useOSProber = false;
      efiSupport = true;
      theme = "/boot/grub/themes/hyperfluent";
      extraEntries = import ./grub-entries.nix;
    };
  };

  networking = {
    hostName = "domum"; # Define your hostname.
    networkmanager.enable = true;
    defaultGateway = "192.168.0.1";
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
    firewall = {
      enable = true;
      allowedTCPPorts = [ 80 443 ];
      allowedUDPPorts = [ 34197 ];
    };
  };

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "fr_CA.UTF-8";

  i18n.extraLocaleSettings = {
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

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    openrazer.enable = true;
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

  # Configure console keymap
  console.keyMap = "cf";

  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  services.mpd = {
    enable = true;
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "My PipeWire Output"
      }
    '';
  };
  services.samba = {
  enable = true;
  securityType = "user";
  openFirewall = true;
  extraConfig = ''
    workgroup = WORKGROUP
    server string = smbnix
    netbios name = smbnix
    security = user 
    hosts allow = 192.168.0. 127.0.0.1 localhost
    hosts deny = 0.0.0.0/0
    guest account = nobody
    map to guest = bad user
  '';
  };

  services.samba-wsdd = {
    enable = true;
    openFirewall = true;
  };
  services.gvfs.enable = true;

  services.openssh.ports = [ 22 443 2222 7422 ];

  systemd.sockets.mpd.listenStreams = [ "/run/mpd/socket" ];
  systemd.services.mpd.environment = {
    # https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/609
    # User-id 1000 must match above user. MPD will look inside this directory for the PipeWire socket.
    XDG_RUNTIME_DIR = "/run/user/1000";
  };

  # Enable the X11 windowing system.
  services = {
    desktopManager.plasma6.enable = true;
    xserver = {
      enable = true;
      # Enable the KDE Plasma Desktop Environment.
      displayManager.sddm.enable = true;


      # Configure keymap in X11
      xkb = {
        layout = "ca";
        variant = "multix";
      };
    };
  };

  xdg = {
    autostart.enable = true;
    menus = {
      enable = true;
    };
    portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal
        pkgs.xdg-desktop-portal-gtk
      ];
    };
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.defaultUserShell = pkgs.zsh;
  users.users.rufuslevi = {
    isNormalUser = true;
    description = "Michael Roussel";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # For Sublime4
  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1w"
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    gnome.gvfs
    unzip
    dex
    speedtest-rs
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
    gnome.nautilus
    kdePackages.dolphin
    kdePackages.partitionmanager
    kdePackages.kirigami
    kdePackages.systemsettings
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
    ranger
    openrgb-with-all-plugins
    go-task
    hyprland-protocols
    hyprpicker
    hyprpaper
    nwg-panel
    yambar
    yambar-hyprland-wses
    eww
    tofi
    wofi
    inputs.anyrun.packages.${pkgs.system}.anyrun
    xdg-utils
    xdg-ninja
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-wlr
    xdg-desktop-portal-hyprland
    glib
    nixpkgs-fmt
    nixpkgs-lint
  ];

  programs = {
    nix-ld.enable = true;
    zsh = {
      enable = true;
    };
    git = {
      enable = true;
    };
    neovim = {
      enable = true;
      defaultEditor = true;
    };
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    waybar = {
      enable = true;
    };
    dconf = {
      enable = true;
    };
    firefox = {
      enable = true;
      package = pkgs.firefox-devedition;
      preferences = {
        "browser.tabs.inTitlebar" = 0;
        "browser.compactmode.show" = true;
        "browser.tabs.closeWindowWithLastTab" = false;
        "browser.translations.automaticallyPopup" = false;
        "browser.translations.panelShown" = false;
        "svg.context-properties.content.enabled" = true;
        "intl.multilingual.enabled" = true;
      };
      preferencesStatus = "default";
      languagePacks = [ "fr" ];
    };
    steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    };
    nix-ld.libraries = with pkgs; [
      alsa-lib
      at-spi2-atk
      at-spi2-core
      atk
      cairo
      cups
      curl
      dbus
      expat
      fontconfig
      freetype
      fuse3
      gdk-pixbuf
      glib
      gtk3
      icu
      libGL
      libappindicator-gtk3
      libdrm
      libglvnd
      libnotify
      libpulseaudio
      libunwind
      libusb1
      libuuid
      libxkbcommon
      libxml2
      mesa
      nspr
      nss
      openssl
      pango
      pipewire
      stdenv.cc.cc
      systemd
      vulkan-loader
      xorg.libX11
      xorg.libXScrnSaver
      xorg.libXcomposite
      xorg.libXcursor
      xorg.libXdamage
      xorg.libXext
      xorg.libXfixes
      xorg.libXi
      xorg.libXrandr
      xorg.libXrender
      xorg.libXtst
      xorg.libxcb
      xorg.libxkbfile
      xorg.libxshmfence
      zlib
    ];
  };

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "Monaspace" "SourceCodePro" "CascadiaCode" ]; })
  ];

  services.openssh.enable = true;
  services.hardware.openrgb.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
    MOZ_ENABLE_WAYLAND = "1";
  };
}
