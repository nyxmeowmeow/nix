{ ... }: {
imports = [
./colorscheme.nix
./options.nix
./lsp.nix
./telescope.nix
];
	programs.nixvim = {
		enable = true;
		
clipboard.register = "unnamedplus";
		plugins.lualine = {
			enable = true;
		};
	};
	 }
