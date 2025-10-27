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

    plugins = {
      git = pkgs.yaziPlugins.git;
      sudo = pkgs.yaziPlugins.sudo;
      no-status = pkgs.yaziPlugins.no-status;
      starship = pkgs.yaziPlugins.starship;
      restore = pkgs.yaziPlugins.restore;
      chmod = pkgs.yaziPlugins.chmod;
      piper = pkgs.yaziPlugins.piper;
      mount = pkgs.yaziPlugins.mount;
      dupes = pkgs.yaziPlugins.dupes;
      jump-to-char = pkgs.yaziPlugins.jump-to-char;
      compress = ./plugins/compress.yazi;
      gvfs = ./plugins/gvfs.yazi;
    };

    initLua = /* lua */ ''
      -- require("folder-rules"):setup()
      require("no-status"):setup()
      -- require("mime-preview"):setup()
      -- require("simple-tag"):setup()
      require("git"):setup()
      require("starship"):setup()
      require("gvfs"):setup()

require("dupes"):setup {
	-- Global settings
	save_op = false,        -- Save results to file by default
	-- auto_confirm = true, -- Skip confirmation for apply (use with caution!)
	
	profiles = {
		interactive = {
			args = { "-r" },
		},
		apply = {
			args = { "-r", "-N", "-d" },
			save_op = false,  -- Save results before deletion
		},
	},
}

    '';
  };
}
