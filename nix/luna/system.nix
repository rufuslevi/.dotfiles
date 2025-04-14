{ ... }:

{
  system = {
    stateVersion = 5;
    defaults = {
      NSGlobalDomain.InitialKeyRepeat = 15;
      NSGlobalDomain.KeyRepeat = 2;
      finder = {
        FXDefaultSearchScope = "SCcf";
        FXPreferredViewStyle = "Nlsv";
        QuitMenuItem = true;
        ShowPathbar = true;
        _FXShowPosixPathInTitle = false;
      };
    };
  };

  security.pam.services.sudo_local.touchIdAuth = true;
}
