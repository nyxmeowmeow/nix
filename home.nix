{ ... }: {

  imports = [

    /* theme */
    ./themes/black/.black_theme.nix
    # ./themes/macchiato/.macchiato_theme.nix


    ./homeManagerModules/hyprland.nix
    ./homeManagerModules/nushell.nix
    ./homeManagerModules/starship.nix
    # ./homeManagerModules/yazi.nix
    ./homeManagerModules/clipse.nix
    ./homeManagerModules/fastfetch.nix
    ./homeManagerModules/ncmpcpp.nix
    ./homeManagerModules/btop.nix
    ./homeManagerModules/git.nix
    ./homeManagerModules/dunst.nix
    ./homeManagerModules/mpv.nix
    ./homeManagerModules/vesktop.nix
  ];

  home.username = "meow";
  home.homeDirectory = "/home/meow";
  home.stateVersion = "24.11";

  # home.sessionVariables


  # xdg.desktopEntries = {
  #   fish.noDisplay = true;
  #   yazi.noDisplay = true;
  #   btop.noDisplay = true;
  # };


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
