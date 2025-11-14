{
  username,
  flake_dir,
  inputs,
  config,
  ...
}: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "bak";
    extraSpecialArgs = {
      inherit username flake_dir inputs ;
      theme = config.theme;
      host = config.networking.hostName;
      # rounding = config.rounding;
      wm = config.wm;
      zen-browser = inputs.zen-browser;
      os_config = config;

    };


    users.${username} = {
      home.stateVersion = "24.11";
      imports = [
        ../../theme/blacchiato/hm/default.nix
        ../../theme/everforest/hm/default.nix
        ../../theme/lix/hm/default.nix
        ../../theme/macchiato/hm/default.nix
        ../../theme/kanso/hm/default.nix
        ../../theme/kantsi/hm/default.nix
        ../../mod/hm/desktop.nix
        ../../mod/hm/home.nix

        ../../mod/hm/tui/nixvim/default.nix


        ../../mod/hm/gui/browser_css/default.nix

        ../../mod/hm/gui/dunst.nix
        ../../mod/hm/gui/emacs/emacs.nix
        ../../mod/hm/gui/firefox/firefox.nix
        ../../mod/hm/gui/terminal/foot.nix
        ../../mod/hm/gui/terminal/ghostty.nix
        ../../mod/hm/gui/terminal/kitty.nix
        ../../mod/hm/gui/mango/mango.nix
        ../../mod/hm/gui/media/mpv.nix
        ../../mod/hm/gui/media/ytsub.nix
        ../../mod/hm/gui/niri/niri.nix
        ../../mod/hm/gui/media/obs.nix
        ../../mod/hm/gui/rofi.nix
        ../../mod/hm/gui/shell.nix
        ../../mod/hm/gui/media/swayimg.nix
        ../../mod/hm/gui/textfox.nix
        ../../mod/hm/gui/tofi.nix
        ../../mod/hm/gui/vesktop/vesktop.nix
        ../../mod/hm/gui/walker.nix
        ../../mod/hm/gui/vicinae.nix
        ../../mod/hm/gui/wlr-which-key.nix
        ../../mod/hm/gui/zen/zen.nix
        ../../mod/hm/service/easyeffects.nix
        ../../mod/hm/service/hyprkan.nix
        ../../mod/hm/service/swww.nix
        ../../mod/hm/tui/bash.nix
        ../../mod/hm/tui/btop.nix
        ../../mod/hm/tui/clipse.nix
        ../../mod/hm/tui/fzf.nix
        ../../mod/hm/tui/git.nix
        ../../mod/hm/tui/iamb.nix
        ../../mod/hm/tui/navi.nix
        ../../mod/hm/tui/ncmpcpp.nix
        ../../mod/hm/tui/nh.nix
        ../../mod/hm/tui/nushell.nix
        ../../mod/hm/tui/rust-fmt.nix
        ../../mod/hm/tui/starship.nix
        ../../mod/hm/tui/yazi/yazi.nix
        ../../mod/hm/tui/zoxide.nix
        ./niri.nix
        # ../../mod/hm/gui/hyprland.nix
      ];
    };
  };
}
