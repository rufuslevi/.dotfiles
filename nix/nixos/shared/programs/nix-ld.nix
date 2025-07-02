{ pkgs, ... }:

{
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
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
      libcamera
      libdrm
      libgcc
      libglvnd
      libnotify
      libpulseaudio
      libunwind
      libusb1
      libuuid
      libxkbcommon
      libxml2
      libllvm
      llvm
      llvmPackages_12.libllvm
      mesa
      nspr
      nss
      openssl
      pango
      stdenv.cc.cc
      systemd
      time
      vulkan-loader
      zlib
    ];
  };
}
