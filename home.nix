{ inputs, ... }: {

  home.username = "meow";
  home.homeDirectory = "/home/meow";
  home.stateVersion = "24.11";
  
  imports = [
    ./homeManagerModules/hyprland.nix
    ./homeManagerModules/foot.nix
    ./homeManagerModules/hyprpaper.nix
    ./homeManagerModules/clipse.nix
    ./homeManagerModules/ncmpcpp.nix
  ];

  home.packages = [ inputs.zen-browser.packages."x86_64-linux".default ];

  programs.git = {
    enable = true;
    userName = "rainmeower";
    userEmail = "rraaiin@proton.me";
  };


}
