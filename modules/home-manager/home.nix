{ pkgs, config, inputs, ... }: {

  home-manager = {
    extraSpecialArgs = {
      theme = config.theme;
    };
    users.meow = {

      imports = [

    inputs.nixvim.homeModules.nixvim
        ../../themes/black/default.nix
        ../../themes/lix/default.nix
        ../../themes/macchiato/default.nix
        ../../themes/ocean/default.nix
        ../../themes/everforest/default.nix


          ./emacs/emacs.nix
          ./foot.nix
          ./niri/niri.nix
          # ./hyprland.nix
          ./tofi.nix
          ./nushell.nix
          ./starship.nix
          ./yazi/yazi.nix
          ./clipse.nix
          ./ncmpcpp.nix
          ./btop.nix
          ./git.nix
        # ./bash.nix
          ./fzf.nix
          ./zoxide.nix
          ./dunst.nix
          ./mpv.nix
          ./vesktop.nix
      ];

      home.username = "meow";
      home.homeDirectory = "/home/meow";
      home.stateVersion = "24.11";





    };
  };
}
