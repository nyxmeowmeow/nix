{ ... }: {
imports = [
./colorscheme.nix
];
	programs.nixvim = {
		enable = true;
		plugins.lualine = {
			enable = true;
		};
	};
	 }
