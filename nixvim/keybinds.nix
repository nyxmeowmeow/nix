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
		mode = [ "n" "v" "x" ];
	}
	{
		key = "<C-e>";
		action = "<C-u>";
		mode = [ "n" "v" "x" ];
	}
	{
		key = "<C-S>";
		action = "<cmd>w<cr>";
		mode = [ "i" "n" "v" "x" ];
		options.silent = true;
	}
	{
		key = "<leader>h";
		action = "<cmd>bp<cr>";
		mode = [ "n" "v" "x" ];
	}
	{
		key = "<leader>l";
		action = "<cmd>bn<cr>";
		mode = [ "n" "v" "x" ];
	}
	];
};

}
