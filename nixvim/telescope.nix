{ ... }: {
	programs.nixvim = {
		plugins.telescope = {
			enable = true;
		};
	keymaps = [
	{
		key = "<leader><space>";
		action = "require'telescope.builtin'.find_files{}";
		mode = "n";
		lua = true;
	}
	];
	};
}
