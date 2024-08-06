{ pkgs, ... }:

{
  users = {
    users.rufuslevi = {
      createHome = true;
      homeMode = "750";
      shell = pkgs.zsh;
      isNormalUser = true;
      description = "Michael Roussel";
      extraGroups = [ "networkmanager" "wheel" "video" "render" ];
    };
  };
}
