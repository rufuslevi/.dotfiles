{ pkgs, ... }:

{
  home-manager = { enable = true; };
  bat = { enable = true; };
  zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    enableAutosuggestions = true;
    plugins = [{
      name = "powerlevel10k";
      src = pkgs.zsh-powerlevel10k;
      file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    }];
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "colored-man-pages" ];
    };
    initExtra = ''
      source ~/.config/zsh/.zshrc
    '';
  };
  neovim = {
    enable = true;
    defaultEditor = true;
  };
  # vscode = {
  #   enable = true;
  #   package = pkgs.vscodium;
  # userSettings = {
  #   "workbench.colorTheme" = "Catppuccin Mocha";
  #   "workbench.iconTheme" = "catppuccin-mocha";
  #   "workbench.preferredLightColorTheme" = "Rosé Pine Dawn";
  #   "workbench.preferredDarkColorTheme" = "Catppuccin Mocha";
  #   "catppuccin.workbenchMode" = "flat";
  #   "workbench.productIconTheme" = "fluent-icons";
  #   "editor.fontFamily" =
  #     "'MonaspiceNe Nerd Font' 'CaskaydiaCove Nerd Font' 'SauceCodePro Nerd Font', 'Courier Prime'";
  #   "editor.fontLigatures" = true;
  #   "editor.fontSize" = 14;
  #   "editor.lineNumbers" = "relative";
  #   "editor.formatOnSave" = true;
  #   "terminal.integrated.fontSize" = 15;
  #   "sync.gist" = "ac07d9fbc072e254fc772e624849d3c8";
  #   "security.workspace.trust.untrustedFiles" = "open";
  #   "[jsonc]" = { "editor.defaultFormatter" = "esbenp.prettier-vscode"; };
  #   "window.autoDetectColorScheme" = true;
  #   "powermode.enabled" = false;
  #   "git.confirmSync" = false;
  #   "redhat.telemetry.enabled" = false;
  #   "notebook.stickyScroll.enabled" = true;
  #   "editor.stickyScroll.enabled" = true;
  #   "editor.renderWhitespace" = "none";
  #   "[c]" = { "editor.defaultFormatter" = "xaver.clang-format"; };
  #   "clang-format.executable.osx" = "clang-format";
  #   "clang-format.style" = "chromium";
  #   "editor.guides.bracketPairs" = "active";
  #   "editor.accessibilitySupport" = "off";
  #   "terminal.integrated.env.osx" = { "FIG_NEW_SESSION" = "1"; };
  #   "dotnet.codeLens.enableReferencesCodeLens" = false;
  #   "window.customTitleBarVisibility" = "never";
  #   "window.systemColorTheme" = "auto";
  #   "vim.leader" = " ";
  #   "git.autofetch" = true;
  #   "keyboard.dispatch" = "keyCode";
  # };
  # extensions = with pkgs.vscode-extensions;
  #   [
  #     mvllow.rose-pine
  #     catppuccin.catppuccin-vsc
  #     catppuccin.catppuccin-vsc-icons
  #     esbenp.prettier-vscode
  #     dbaeumer.vscode-eslint
  #     jnoortheen.nix-ide
  #   ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [{
  #     name = "remote-ssh-edit";
  #     publisher = "ms-vscode-remote";
  #     version = "0.47.2";
  #     sha256 = "1hp6gjh4xp2m1xlm1jsdzxw9d8frkiidhph6nvl24d0h8z34w49g";
  #   }];
  # };
}
