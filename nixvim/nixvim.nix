{
imports = [
./ui/colorscheme.nix
./ui/telescope.nix
./ui/lualine.nix
./ui/noice.nix
./options.nix
./lsp.nix
./keymaps/keymaps.nix
./keymaps/no_yank_del.nix
./langmap.nix
./misc.nix
./yazi.nix
];

	programs.nixvim = {
		enable = true;
	};
}
