{ config, pkgs, ... }: {

  home.username = "meow";
  home.homeDirectory = "/home/meow";
  home.stateVersion = "24.11";
  # home.packages = [ inputs.zen-browser.packages."x86_64-linux".default ];

  imports = [
    ./homeManagerModules/hyprland.nix
    ./homeManagerModules/foot.nix
    ./homeManagerModules/hyprpaper.nix
    ./homeManagerModules/clipse.nix
    ./homeManagerModules/ncmpcpp.nix
    # ./homeManagerModules/yazi.nix
    # ./homeManagerModules/fish.nix
    ./homeManagerModules/btop.nix
    ./homeManagerModules/dunst.nix
    # ./homeManagerModules/mpv.nix
  ];


  programs.git = {
    enable = true;
    userName = "rainmeower";
    userEmail = "rraaiin@proton.me";
  };


}
