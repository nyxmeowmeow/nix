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
      # duckdb = pkgs.yaziPlugins.duckdb;
      compress = ./plugins/compress.yazi;
      gvfs = ./plugins/gvfs.yazi;
      file-actions = ./plugins/gvfs.yazi;
      pref-by-location = ./plugins/pref-by-location.yazi;
      open-with-cmd = ./plugins/open-with-cmd.yazi;
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
	save_op = false, -- dont save results to file
	profiles = {
		interactive = {
			args = { "-r" },
		},
		apply = {
			args = { "-r", "-N", "-d" },
			save_op = false,  -- dont save results before deletion
		},
	},
}



local pref_by_location = require("pref-by-location")
pref_by_location:setup({
  prefs = {
    {
      location = ".*/Downloads",
      sort = {
        "btime",
        reverse = true,
        dir_first = true
      }
    },
    {
      location = ".*/Trash/files",
      sort = {
        "mtime",
        reverse = true,
        dir_first = false
      }
    },
    {
      location = ".*/Trash/info",
      sort = {
        "mtime",
        reverse = true,
        mir_first = false
      }
    },
  },
})

    '';
  };
}
