{ pkgs, ... }:

{
  programs.firefox = {
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
      "widget.use-xdg-desktop-portal.file-picker" = 1;
      "widget.use-xdg-desktop-portal.location" = 1;
      "widget.use-xdg-desktop-portal.mime-handler" = 1;
      "widget.use-xdg-desktop-portal.open-uri" = 1;
      "widget.use-xdg-desktop-portal.settings" = 1;
    };
    preferencesStatus = "default";
    languagePacks = [ "fr" ];
  };
}
