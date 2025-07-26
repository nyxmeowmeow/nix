{ inputs, config, username, ... }: {
  home-manager = {
    extraSpecialArgs = {
      theme = config.theme;
      zen-browser = inputs.zen-browser;
    };

    users.${username} = {
      imports = [
        ../../themes/black/home-manager/default.nix
        ../../themes/everforest/home-manager/default.nix
        ../../themes/lix/home-manager/default.nix
        ../../themes/macchiato/home-manager/default.nix
        ../../themes/kanso/home-manager/default.nix
        ./desktop.nix
        ./home.nix

        inputs.nixvim.homeModules.nixvim
        ./tui/nixvim/default.nix

        ./tui/nh.nix
        ./tui/navi.nix
        ./tui/btop.nix
        ./gui/obs.nix
        ./tui/clipse.nix
        ./gui/dunst.nix
        ./gui/emacs/emacs.nix
        ./gui/foot.nix
        ./tui/fzf.nix
        ./tui/git.nix
        ./gui/mpv.nix
        ./tui/ncmpcpp.nix
        ./gui/niri/niri.nix
        ./tui/nushell.nix
        ./tui/starship.nix
        ./gui/tofi.nix
        ./gui/vesktop.nix
        ./tui/yazi/yazi.nix
        ./gui/zen/zen.nix
        ./tui/zoxide.nix
        ./tui/bash.nix
        # ./hyprland.nix
      ];
    };
  };
}
