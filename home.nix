{ ... }: {

  imports = [
    ./homeManagerModules/hyprland.nix
    ./homeManagerModules/hyprpaper.nix
    ./homeManagerModules/foot.nix
    ./homeManagerModules/nushell.nix
    ./homeManagerModules/starship.nix
    # ./homeManagerModules/yazi.nix
    ./homeManagerModules/clipse.nix
    ./homeManagerModules/fastfetch.nix
    ./homeManagerModules/ncmpcpp.nix
    ./homeManagerModules/btop.nix
    ./homeManagerModules/lazygit.nix
    ./homeManagerModules/dunst.nix
    ./homeManagerModules/mpv.nix
    ./homeManagerModules/vesktop.nix
  ];

  home.username = "meow";
  home.homeDirectory = "/home/meow";
  home.stateVersion = "24.11";

  # home.sessionVariables




  programs.git = {
    enable = true;
    userName = "rainmeower";
    userEmail = "rraaiin@proton.me";
  };

  ## doesnt work?
  # programs.fzf = {
  #   enable = true;
  #   colors = {
  #
  #     fg = "#cad3f5";
  #     hl = "#8bd5ca";
  #     "fg+" = "#cad3f5";
  #     "bg+" = "#363a4f";
  #     "hl+" = "#8bd5ca";
  #     # info = "7f8c8d";
  #     prompt = "#b7bdf8";
  #     spinner = "#b7bdf8";
  #     pointer = "#b7bdf8";
  #     gutter = "-1";
  #     info = "#939ab7";
  #     border = "#494d64";
  #   };
  #
  # };
  #

}
