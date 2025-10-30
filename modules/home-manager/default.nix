{
  inputs,
  config,
  username,
  ...
}: {
  home-manager = {
    extraSpecialArgs = {
      theme = config.theme;
      font_size = config.font_size;


      zen-browser = inputs.zen-browser;
    };

    users.${username} = {
      imports = [
        ../../themes/blacchiato/home-manager/default.nix
        ../../themes/everforest/home-manager/default.nix
        ../../themes/lix/home-manager/default.nix
        ../../themes/macchiato/home-manager/default.nix
        ../../themes/kanso/home-manager/default.nix
        ../../themes/kantsi/home-manager/default.nix
        ./desktop.nix
        ./home.nix
        ./mimetypes.nix

        inputs.nixvim.homeModules.nixvim
        ./tui/nixvim/default.nix

        # ./gui/textfox.nix
        ./gui/dunst.nix
        ./gui/emacs/emacs.nix
        ./gui/firefox/firefox.nix
        ./gui/foot.nix
        ./gui/ghostty.nix
        ./gui/mpv.nix
        ./gui/niri/niri.nix
        ./gui/obs.nix
        ./gui/shell.nix
        ./gui/tofi.nix
        ./gui/kitty.nix
        ./gui/vesktop/vesktop.nix
        ./gui/walker.nix
        ./gui/zen/zen.nix
        ./hyprland.nix
        ./services/hyprkan.nix
        ./tui/bash.nix
        ./tui/btop.nix
        ./tui/clipse.nix
        ./tui/fzf.nix
        ./tui/git.nix
        ./tui/navi.nix
        ./tui/ncmpcpp.nix
        ./tui/nh.nix
        ./tui/nushell.nix
        ./tui/starship.nix
        ./tui/yazi/yazi.nix
        ./tui/zellij/default.nix
        ./tui/zoxide.nix
        ./gui/swayimg.nix
        ];
    };
  };
}
