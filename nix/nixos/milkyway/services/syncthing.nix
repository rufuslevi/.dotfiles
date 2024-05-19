{ ... }:

{
  services.syncthing = {
    enable = true;
    user = "rufuslevi";
    dataDir = "/mnt/hitachi/syncthing";
    configDir = "/home/rufuslevi/.config/syncthing";
    guiAddress = ":8384";
  };
}
