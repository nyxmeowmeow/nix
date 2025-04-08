{ config, pkgs, ... }: {

  home.username = "meow";
  home.homeDirectory = "/home/meow";
  home.stateVersion = "23.11";
  
  imports =
  [
    ./homeManagerModules/hyprland.nix
    ./homeManagerModules/foot.nix
    ./homeManagerModules/hyprpaper.nix
  ];



  programs.git = {
    enable = true;
    userName = "rainmeower";
    userEmail = "rraaiin@proton.me";
  };


}
