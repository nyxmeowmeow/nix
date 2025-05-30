{ ... }: {
	programs.nixvim = {
		plugins.telescope = {
			enable = true;
			settings = {
				selection_caret = "  ";
				entry_prefix = "  ";
			};
			keymaps = {
				"<leader>r" = "oldfiles";

        "<leader>i" = "find_files { cwd = '/home/meow/nix' }";
			};
		};
	};
	 }
