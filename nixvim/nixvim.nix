{
imports = [
./ui/colorscheme.nix
./ui/telescope.nix
./ui/lualine.nix
./options.nix
./lsp.nix
./keybinds.nix
./langmap.nix
./misc.nix
./yazi.nix
];

	programs.nixvim = {
		enable = true;
	};
}
