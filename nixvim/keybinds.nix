{ ... }: {
programs.nixvim = {
	globals.mapleader = " ";
	keymaps = [
	{
		key = "gh";
		action = "^";
		mode = "n";
	}
	{
		key = "gl";
		action = "$";
		mode = "n";
	}
	{
		key = "<C-a>";
		action = "<C-d>";
		mode = "n";
	}
	{
		key = "<C-e>";
		action = "<C-u>";
		mode = "n";
	}
	{
		key = "<C-S>";
		action = "<cmd>w<cr>";
		mode = "n";
		options.silent = true;
	}
	{
		key = "<leader>h";
		action = "bp";
		mode = "n";
	}
	{
		key = "<leader>l";
		action = "bn";
		mode = "n";
	}
	];
};

}
