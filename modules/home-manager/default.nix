{ inputs, config, ... }: {
  home-manager = {
    extraSpecialArgs = {
      theme = config.theme;
      zen-browser = inputs.zen-browser;
    };

    users.meow = {
      imports = [
        ../../themes/black/default.nix
        ../../themes/everforest/default.nix
        ../../themes/lix/default.nix
        ../../themes/macchiato/default.nix
        ../../themes/ocean/default.nix
        ./btop.nix
        ./clipse.nix
        ./dunst.nix
        ./emacs/emacs.nix
        ./foot.nix
        ./fzf.nix
        ./git.nix
        ./mpv.nix
        ./ncmpcpp.nix
        ./niri/niri.nix
        ./nixvim/default.nix
        ./nushell.nix
        ./starship.nix
        ./tofi.nix
        ./vesktop.nix
        ./yazi/yazi.nix
        ./zen.nix
        ./zoxide.nix
        ./home.nix
        inputs.nixvim.homeModules.nixvim
        # ./bash.nix
        # ./hyprland.nix
      ];
    };
  };
}
