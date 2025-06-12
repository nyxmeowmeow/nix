{ config, ... }: {


  home-manager = {
    extraSpecialArgs = {
      theme = config.theme;
    };
    users.meow = {





      imports = [
        ./themes/black/default.nix
        ./themes/lix/default.nix
        ./themes/macchiato/default.nix
        ./themes/ocean/default.nix

          ./home_modules/foot.nix
          ./home_modules/hyprland.nix
          ./home_modules/tofi.nix
          ./home_modules/nushell.nix
          ./home_modules/starship.nix
        # ./home_modules/yazi.nix
          ./home_modules/clipse.nix
          ./home_modules/ncmpcpp.nix
          ./home_modules/btop.nix
          ./home_modules/git.nix
        # ./home_modules/bash.nix
          ./home_modules/fzf.nix
          ./home_modules/zoxide.nix
          ./home_modules/dunst.nix
          ./home_modules/mpv.nix
          ./home_modules/vesktop.nix
      ];

      home.username = "meow";
      home.homeDirectory = "/home/meow";
      home.stateVersion = "24.11";









    };


  };
                 }
