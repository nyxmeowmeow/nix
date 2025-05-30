{ ... }: {
	programs.nixvim.opts = {
		number = true;
		shiftwidth = 4;
		expandtab = true;
		tabstop = 4;
		relativenumber = true;
		termguicolors = true;
	};
	
}
