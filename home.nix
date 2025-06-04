{

  imports = [
    # ./themes/black/default.nix
    ./themes/lix/default.nix
    # ./themes/macchiato/default.nix

    ./home_modules/hyprland.nix
    ./home_modules/nushell.nix
    ./home_modules/starship.nix
    # ./home_modules/yazi.nix
    ./home_modules/clipse.nix
    ./home_modules/ncmpcpp.nix
    ./home_modules/btop.nix
    ./home_modules/git.nix
    ./home_modules/bash.nix
    ./home_modules/zoxide.nix
    ./home_modules/dunst.nix
    ./home_modules/mpv.nix
    ./home_modules/vesktop.nix
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
