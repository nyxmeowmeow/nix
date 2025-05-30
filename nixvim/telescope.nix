{ ... }: {
	programs.nixvim = {
		plugins.telescope = {
			enable = true;
		};
	keymaps = [
	{
		key = "<leader><space>";
		action = "builtin.oldfiles";
		mode = "n";
		lua = true;
	}
	];
	};
}
