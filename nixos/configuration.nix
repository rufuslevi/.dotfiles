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
      useOSProber = true;
      efiSupport = true;
      theme = "/boot/grub/themes/hyperfluent";
      extraEntries = ''
        menuentry 'Windows Boot Manager (the right one) (on /dev/nvme0n1p1)' --class windows --class os $menuentry_id_option 'osprober-efi-FAF9-831B' {
          insmod part_gpt
          insmod fat
          search --no-floppy --fs-uuid --set=root FAF9-831B
          chainloader /Microsoft/Boot/bootmgfw.efi
        }
      '';
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

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;

    # Enable the KDE Plasma Desktop Environment.
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;

    # Configure keymap in X11
    xkb = {
      layout = "ca";
      variant = "multix";
    };
  };

  xdg = {
    autostart.enable = true;
    portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal
        pkgs.xdg-desktop-portal-gtk
      ];
    };
  };

  # Configure console keymap
  console.keyMap = "cf";

  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
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
  systemd.sockets.mpd.listenStreams = [ "/run/mpd/socket" ];
  systemd.services.mpd.environment = {
    # https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/609
    # User-id 1000 must match above user. MPD will look inside this directory for the PipeWire socket.
    XDG_RUNTIME_DIR = "/run/user/1000";
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
    nwg-look
    wezterm
    kitty
    pavucontrol
    playerctl
    librewolf
    vivaldi
    kate
    openrgb-with-all-plugins
    go-task
    stow
    openrazer-daemon
    zoxide
    cargo
    rustup
    lua
    eza
    gcc
    xflux-gui
    hyprland-protocols
    hyprpicker
    hyprpaper
    yambar
    yambar-hyprland-wses
    eww
    tofi
    wofi
    inputs.anyrun.packages.${pkgs.system}.anyrun
    xdg-utils
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    qt5.qtwayland
    qt6.qmake
    qt6.qtwayland
    adwaita-qt
    adwaita-qt6
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
      enable = false;
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
    (nerdfonts.override { fonts = [ "Monaspace" ]; })
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
