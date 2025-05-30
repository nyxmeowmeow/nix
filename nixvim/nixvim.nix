{ ... }: {
imports = [
./colorscheme.nix
./options.nix
./lsp.nix
./telescope.nix
./keybinds.nix
./langmap.nix
./lualine.nix
];

	programs.nixvim = {
		enable = true;
		clipboard.register = "unnamedplus";
		plugins.web-devicons.enable = true;
	};
}
