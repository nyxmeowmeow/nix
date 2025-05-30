{ ... }: {
imports = [
./colorscheme.nix
];
	programs.nixvim = {
		enable = true;
		colorschemes.catppuccin = {
			enable = true;
			flavour = "mocha";
		};
		plugins.lualine = {
			enable = true;
		};
	};
	 }
