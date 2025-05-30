{ ... }: {
	programs.nixvim = {
		plugins.telescope = {
			enable = true;
			keymaps = {
				"<leader>r" = "oldfiles";
			};
		};
	};
	 }
