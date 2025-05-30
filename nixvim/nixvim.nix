{ ... }: {
imports = [
./colorscheme.nix
./options.nix
./lsp.nix
./telescope.nix
./keybinds.nix
./langmap.nix
./lualine.nix
./misc.nix
];

	programs.nixvim = {
		enable = true;
	};
}
