{
imports = [
./ui/colorscheme.nix
./ui/telescope.nix
./ui/lualine.nix
./ui/noice.nix
./options.nix
./lsp.nix
./keymaps.nix
./langmap.nix
./misc.nix
./yazi.nix
];

	programs.nixvim = {
		enable = true;
	};
}
