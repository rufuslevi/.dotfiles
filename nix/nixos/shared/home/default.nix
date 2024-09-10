{ config, lib, ... }:

{
  imports = [
    ./themes
    ./programs
    ./services
  ];

  home.username = "rufuslevi";
  home.homeDirectory = "/home/rufuslevi";
  home.stateVersion = "24.05";

  # home.activation = {
  #   # https://github.com/philj56/tofi/issues/115#issuecomment-1701748297
  #   regenerateTofiCache = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
  #     tofi_cache=${config.xdg.cacheHome}/tofi-drun
  #     [[ -f "$tofi_cache" ]] && rm "$tofi_cache"
  #   '';
  # };
}
