{ ... }: {
imports = [
./colorscheme.nix
];
	programs.nixvim = {
		enable = true;
clipboard.register = "unnamedplus";
		plugins.lualine = {
			enable = true;
		};
	};
	 }
