{ inputs, config, username, ... }: {
  home-manager = {
    extraSpecialArgs = {
      theme = config.theme;
      font_size = config.font_size;
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
        ./mimetypes.nix

        inputs.nixvim.homeModules.nixvim
        ./tui/nixvim/default.nix

# ./hyprland.nix
        ./gui/dunst.nix
        ./gui/emacs/emacs.nix
        ./gui/foot.nix
        ./gui/mpv.nix
        ./gui/niri/niri.nix
        ./gui/obs.nix
        ./gui/tofi.nix
        ./gui/vesktop.nix
        ./gui/walker.nix
        ./gui/zen/zen.nix
        ./tui/bash.nix
        ./tui/btop.nix
        ./tui/clipse.nix
        ./tui/fzf.nix
        ./tui/git.nix
        ./tui/navi.nix
        ./tui/ncmpcpp.nix
        ./tui/nh.nix
        ./tui/nushell.nix
        ./tui/nushell/completions/niri.nix
        ./tui/starship.nix
        ./tui/yazi/yazi.nix
        ./tui/zellij/default.nix
        ./tui/zoxide.nix
        ];
    };
  };
}
