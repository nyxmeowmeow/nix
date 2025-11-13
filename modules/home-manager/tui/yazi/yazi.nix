{ pkgs, username, ... }: {
  imports = [
    ./settings.nix
    ./keymap.nix
    ./theme.nix
  ];

  # home.packages = with pkgs; [
  #   xdg-desktop-portal-termfilechooser
  # ];

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
      simple-tag = ./plugins/simple-tag.yazi;
    };

    initLua = /* lua */ ''
-- require("folder-rules"):setup()
require("no-status"):setup()
-- require("mime-preview"):setup()
require("simple-tag"):setup({
  -- UI display mode (icon, text, hidden)
  ui_mode = "icon", -- (Optional)

  -- Disable tag key hints (popup in bottom right corner)
  hints_disabled = false, -- (Optional)

  -- linemode order: adjusts icon/text position. For example, if you want icon to be on the most left of linemode then set linemode_order larger than 1000.
  -- More info: https://github.com/sxyazi/yazi/blob/077faacc9a84bb5a06c5a8185a71405b0cb3dc8a/yazi-plugin/preset/components/linemode.lua#L4-L5
  linemode_order = 500, -- (Optional)

  -- You can backup/restore this folder within the same OS (Linux, windows, or MacOS).
  -- But you can't restore backed up folder in the different OS because they use difference absolute path.
  -- save_path =  -- full path to save tags folder (Optional)
  --       - Linux/MacOS: os.getenv("HOME") .. "/.config/yazi/tags"
  --       - Windows: os.getenv("APPDATA") .. "\\yazi\\config\\tags"
  save_path = "/home/${username}/.config/yazi/tags"

  -- Set tag colors
  colors = { -- (Optional)
	  -- Set this same value with `theme.toml` > [mgr] > hovered > reversed
	  -- Default theme use "reversed = true".
	  -- More info: https://github.com/sxyazi/yazi/blob/077faacc9a84bb5a06c5a8185a71405b0cb3dc8a/yazi-config/preset/theme-dark.toml#L25
	  reversed = true, -- (Optional)

	  -- More colors: https://yazi-rs.github.io/docs/configuration/theme#types.color
    -- format: [tag key] = "color"
	  ["*"] = "magenta", -- (Optional)
	  ["$"] = "green",
	  ["!"] = "yellow",
	  ["1"] = "cyan",
	  ["p"] = "red",
	  ["g"] = "cyan",
  },

  -- Set tag icons. Only show when ui_mode = "icon".
  -- Any text or nerdfont icons should work as long as you use nerdfont to render yazi.
  -- Default icon from mactag.yazi: ●; Some generic icons: , , 󱈤
  -- More icon from nerd fonts: https://www.nerdfonts.com/cheat-sheet
  icons = { -- (Optional)
    -- default icon
		default = "●",

    -- format: [tag key] = "tag icon"
		["*"] = "*",
		["$"] = "",
		["!"] = "",
		["p"] = "",
		["g"] = "",
  },

})
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
