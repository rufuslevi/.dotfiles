{ pkgs, ... }:

{
  stylix = {
    enable = true;
    autoEnable = false;
    homeManagerIntegration.autoImport = true;
    homeManagerIntegration.followSystem = false;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
    cursor = {
      name = "Volantes Cursors";
      package = pkgs.volantes-cursors;
      size = 24;
    };
    targets = {
      grub.enable = true;
      regreet.enable = true;
    };
  };

  home-manager = {
    users.rufuslevi = {
      stylix = {
        enable = true;
        autoEnable = false;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
        cursor = {
          name = "Volantes Cursors";
          package = pkgs.volantes-cursors;
          size = 24;
        };
        fonts = {
          sizes = {
            applications = 12;
            desktop = 14;
            popups = 12;
            terminal = 12;
          };
          serif = {
            name = "Source Code Pro";
            package = pkgs.source-code-pro;
          };
          sansSerif = {
            name = "MonaspiceNe Nerd Font Regular";
            package = pkgs.nerd-fonts.monaspace;
          };
          monospace = {
            name = "Maple Mono NF";
            package = pkgs.maple-mono.NF;
          };
          emoji = {
            name = "Noto Color Emoji";
            package = pkgs.noto-fonts-color-emoji;
          };
        };
        targets = {
          noctalia-shell.enable = true;
          kitty.enable = true;
          ghostty.enable = true;
          qt.enable = true;
        };
      };
    };
  };
}
