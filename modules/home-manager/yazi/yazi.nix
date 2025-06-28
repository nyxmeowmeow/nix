{ pkgs, ... }: {

  imports = [
  ./settings.nix
  ./keymap.nix
  ./theme.nix
  ];

  programs.yazi = {
    enable = true;
    # enableFishIntegration = true;
    enableNushellIntegration = true;
    initLua = ''
      -- require("folder-rules"):setup()
      require("no-status"):setup()
      -- require("mime-preview"):setup()
      -- require("simple-tag"):setup()
      require("git"):setup()
      require("starship"):setup()
    '';

    plugins = {
      git = pkgs.yaziPlugins.git;
      sudo = pkgs.yaziPlugins.sudo;
      no-status = pkgs.yaziPlugins.no-status;
      starship = pkgs.yaziPlugins.starship;
      restore = pkgs.yaziPlugins.restore;
      chmod = pkgs.yaziPlugins.chmod;
      piper = pkgs.yaziPlugins.piper;
      mount = pkgs.yaziPlugins.mount;
      jump-to-char = pkgs.yaziPlugins.jump-to-char;
      compress = "./compress.lua";
    };

      # require("git"):setup()
      # require("folder-rules"):setup()
      # require("no-status"):setup()
      # require("simple-tag"):setup()

    # flavours = "../stuff/yazitheme.lua";

  };
}
