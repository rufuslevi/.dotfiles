{ user, pkgs, ... }:

{
  homebrew = import ./brew.nix { };
  programs = import ./programs.nix { inherit pkgs; };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${user}.imports = [ ./home/home.nix ];
  };

  nix = {
    settings = { experimental-features = "nix-command flakes"; };
    extraOptions = ''
      auto-optimise-store = true
      experimental-features = nix-command flakes
    '';
  };

  nixpkgs = {
    config = {
      allowUnsupportdSystem = true;
      allowBroken = true;
    };
  };

  services = {
    nix-daemon.enable = true;
    yabai = {
      enable = true;
      package = pkgs.yabai;
      enableScriptingAddition = true;
      config = {
        layout = "bsp";
        top_padding = 8;
        right_padding = 8;
        bottom_padding = 8;
        left_padding = 8;
        window_gap = 4;
        focus_follows_mouse = "off";
        mouse_modifier = "ctrl";
        mouse_action1 = "move";
        mouse_action2 = "resize";
      };
      extraConfig = ''
        # Disabled apps
        yabai -m rule --add app="^Réglages système$" manage=off
        yabai -m rule --add app="^Calculatrice$" manage=off
        yabai -m rule --add app="^QuickTime Player$" manage=off
        yabai -m rule --add app="^Finder$" manage=off
        yabai -m rule --add app="^Equinox$" manage=off
        yabai -m rule --add app="^SigmaOS$" manage=off
        yabai -m rule --add app="^Arc$" title="^$" mouse_follows_focus=off
      '';
    };
    skhd = {
      enable = true;
      package = pkgs.skhd;
      skhdConfig = ''
          # Toggle yabai
          # ctrl + shift - f : yabai -m space --layout float
          # ctrl + shift - b : yabai -m space --layout bsp
          # ctrl - t : yabai -m space --layout $(yabai -m query --spaces --space | jq -r 'if .type == "
          # bsp " then "
          # float " else "
          # bsp "
          # end')

          # Change window focus
          ctrl + shift - j: yabai - m window - -focus south
          ctrl + shift - k: yabai - m window - -focus north
          ctrl + shift - h: yabai - m window - -focus west
          ctrl + shift - l: yabai - m window - -focus east

          ctrl - v: yabai - m window - -toggle float

          # Change virt desktop focus
          ctrl - 0 x18: yabai - m space - -create
          ctrl - 0 x1B: yabai - m space - -destroy
          ctrl - 0 x2B: yabai - m space - -focus prev
          ctrl - 0 x2F: yabai - m space - -focus next
          ctrl - 1 : yabai -m space --focus 1
        ctrl - 2 : yabai -m space --focus 2
        ctrl - 3 : yabai -m space --focus 3
        ctrl - 4 : yabai -m space --focus 4
        ctrl - 5 : yabai -m space --focus 5
        ctrl - 6 : yabai -m space --focus 6
        ctrl - 7 : yabai -m space --focus 7
        ctrl - 8 : yabai -m space --focus 8
        ctrl - 9 : yabai -m space --focus 9

        # Move windows to through spaces 
        ctrl + shift - 1 : yabai -m window --space 1
        ctrl + shift - 2 : yabai -m window --space 2
        ctrl + shift - 3 : yabai -m window --space 3
        ctrl + shift - 4 : yabai -m window --space 4
        ctrl + shift - 5 : yabai -m window --space 5
        ctrl + shift - 6 : yabai -m window --space 6
        ctrl + shift - 7 : yabai -m window --space 7
        ctrl + shift - 8 : yabai -m window --space 8
        ctrl + shift - 9 : yabai -m window --space 9

        # Balance windows
        # shift + ctrl - b : yabai -m space --balance

        # Change mouse modes
        # ctrl + alt - p : yabai -m config focus_follows_mouse autofocus
        # ctrl + alt - o : yabai -m config focus_follows_mouse off

        # Toggle keyboard key swap for the forward slash
        ctrl + shift + alt - a : bash ~/Developer/scripts/keymapping.sh

        # Toggle dark mode
        ctrl + shift - d : osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to not dark mode'

        # Vim keybind for arrows
        alt - h : skhd -k "0x7B"

          alt - j : skhd -k "0x7D"

          alt - k : skhd -k "0x7E"

          alt - l : skhd -k "0x7C"
      '';
    };
  };

  networking = { hostName = "luna"; };

  security.pam.enableSudoTouchIdAuth = true;

  users.users.${user} = {
    name = "${user}";
    home = "/Users/${user}/";
    isHidden = false;
    shell = "zsh";
  };

  fonts = {
    fontDir.enable = true;
    fonts = with pkgs;
      [
        (nerdfonts.override {
          fonts = [ "Monaspace" "SourceCodePro" "CascadiaCode" ];
        })

      ];
  };

  system.stateVersion = 4;
}

