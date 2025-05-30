{ ... }: {
	programs.nixvim = {
		plugins.telescope = {
			enable = true;
			keymaps = {
				"<leader>r" = "oldfiles";

        "<leader>i" = "find_files { cwd = '/home/meow/nix' }";
			};
		};
	};
	 }
