{ ... }:

{
  users = {
    users.rufuslevi = {
      createHome = true;
      homeMode = "750";
      isNormalUser = true;
      description = "Michael Roussel";
      extraGroups = [ "networkmanager" "wheel" "video" "render" ];
    };
  };
}
