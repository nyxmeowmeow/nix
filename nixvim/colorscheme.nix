{ ... }: {
	programs.nixvim.colorschemes.catppuccin = {
		enable = true;
		settings = {
			flavour = "macchiato";
			transparent_background = true;
			integrations = {
				treesitter = true;
				gitsigns = true;
				noice = true;

		};
	};
    };
}
